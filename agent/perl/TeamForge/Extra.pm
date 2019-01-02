
package TeamForge::Extra;

=head1 NAME

TeamForge::Extra - Additional, non-standard Methods

=head1 SYNOPSIS

    use TeamForge;
    $ctf   = TeamForge->new();
    $skey  = $ctf->login( $user, $password );

    # Initialize Extra Object
    $extra = $ctf->Extra();
    $extra->init( $user, $skey );

    # Get an object to work with.
    $artf  = $ctf->TrackerApp->getArtifactData( $skey, $artifactId );

    # Monitor the object.
    $extra->monitorObject( $artf );

    # Stop Monitoring the Object
    $extra->stopMonitoringObject( $artf );
    
=head1 DESCRIPTION

This package of extra methods augments the standard TeamForge SOAP API
with non-standard services.

=head2 NOTE

This Extras package provides these features by using the Web Interface
of TeamForge.  When initialized with a user and a valid SOAP session
the object connects to TeamForge to get a valid session cookie to
perform the operations with.

If the web interface is protected by an SSO system this extras kit may
not work.  If proxy settings need to be configured, the LWP::UserAgent
object is accessbile via the ua method.

    $extra->ua->env_proxy;

See the LWP::UserAgent manpage for more.

=head1 METHODS

=over 4

=item init()

    $extra->init( $user, $skey );

Initialize the extras object with a new user.

=item monitorObject()

    $object = $ctf->TrackerApp->getArtifactData( $skey, $artifactId );
    $extra->monitorObject( $object );

Monitor the given object.  The object can by any monitorable object as
returned from at get Data SOAP method.

=item stopMonitoringObject()

    $extra->stopMonitoringObject( $object );

Stop monitoring the specified object.

=item getUsersMonitoringObject()

    $list = $extra->getUsersMonitoringObject( $object );

    while( $row = $list->fetchrow ) {
       printf "%-15s: %s\n", $row->username, $row->fullName;
    }

Get the list of users currently monitoring the specified object.  The
return list is a standard TeamForge type List object.  Each row object
has 2 fields: username, fullName.

=item refreshEvents()

    $ans = $extra->refreshEvents()

Refresh the event handler cache.  This is normally only needed when an
event handler is added or updated to the system.

=back

=head1 EXTENDING FEATURES

Much of what is possible in the TeamForge Web UI is done via form
submissions.  This Extras module provides an easy to way to call most
any form action in the TeamForge Web interface.  How to discover form
structure and fields from a webpage is beyond the scope of this
document.

    $ans = $extra->submitForm({
	action  => sprintf("/sf/sfmain/do/monitor/%s", $object->path),
        method  => 'GET',
	fields  => {
	    monitorReturnTo => sprintf("http://localhost/sf/go/%s",$object->id),
	}
    });

    $html = $extra->response->content;

The submitForm method returns the HTTP return code from the form
submission.

submitForm takes 3 arguments:

    form hashref     Defines the structure of the form.
    form-data flag   If set to true, uses a form-data type.  The default 
                     is "application/x-www-form-urlencoded" if not set.
    filename         A file to upload with the form, optional.

The form hashref has three attributes:

    action           This is the action property of the HTML Form.  Use only 
                     relative paths, the host is taken from the invokation of 
                     the $extra object.
    method           GET or POST, the default is GET if unspecified.
    fields           A hashref of form fields and their values.

=cut


use URI;
use LWP::UserAgent;
use HTTP::Request::Common;

sub new {
    my $class = shift;
    my $ctf   = shift;
    my $self  = {
	ua    => LWP::UserAgent->new,
    };

    my $endpoint;
    eval { $endpoint = $ctf->transport->endpoint; };
    if ( $endpoint ) {
	$self->{ host } = URI->new($endpoint);
    }

    $self->{ua}->cookie_jar({});
    $self->{ua}->max_redirect(0);

    bless $self;

    # Now need to invokea SOAP redirect to prime the cookie jar.

}

sub ua { $_[0]->{ ua } }

sub init {
    my $self = shift;
    my $user = shift; # User to log in as
    my $skey = shift; # Session key to use.
    my $form = {
	action => '/sf/sfmain/do/soapredirect',
	fields => {
	    id          => $skey,
	    user        => $user,
	    from        => 'base',
	    redirectUrl => '/sfmain/do/home',
	},
    };

    my $ans = $self->submitForm($form);
}

# http://centos5e.speers.nu/sf/sfmain/do/monitor/projects.sample/tracker.test/artf1003?monitorReturnTo=http%3A%2F%2Flocalhost%3A8080%2Fsf%2Fgo%2Fartf1003
sub monitorObject {
    my $self   = shift;
    my $object = shift;

    die "Invalid object type." unless( ref($object) =~ /DO$/ );

    my $form = {
	action  => sprintf("/sf/sfmain/do/monitor/%s", $object->path),
	fields  => {
	    monitorReturnTo => sprintf("http://localhost/sf/go/%s",$object->id),
	}
    };

    my $ans = $self->submitForm($form);

    return ( $ans == 302 ? 1 : undef );

}

# http://centos5e.speers.nu/sf/sfmain/do/unMonitor/projects.sample/tracker.test/artf1003?monitorReturnTo=http%3A%2F%2Flocalhost%3A8080%2Fsf%2Fgo%2Fartf1003
sub stopMonitoringObject {
    my $self    = shift;
    my $object  = shift; # Needs to be a full DO object.

    die "Invalid object type." unless( ref($object) =~ /DO$/ );

    my $form = {
	action  => sprintf("/sf/sfmain/do/unMonitor/%s", $object->path),
	fields  => {
	    monitorReturnTo => sprintf("http://localhost/sf/go/%s",$object->id),
	}
    };

    my $ans = $self->submitForm($form);

    return ( $ans == 302 ? 1 : undef );

}

# https://forge.collab.net/sf/sfmain/do/listMonitoringUsers/projects.custissues/tracker.cri/artf72032
sub getUsersMonitoringObject {
    my $self   = shift;
    my $object = shift;

    die "Invalid object type." unless( ref($object) =~ /DO$/ );

    my $form = {
	action   => sprintf("/sf/sfmain/do/listMonitoringUsers/%s",$object->path),
    };    

    my $ans = $self->submitForm($form);

    my $list = {
	dataRows => [],
    };
    bless $list, 'userMonitoringList';

    for my $user (grep/target="_new"/, split(/\n/, $self->{ response }->content )) {

	# <a href="/sf/global/do/viewUser/admin" target="_new">TeamForge Administrator</a>
	if ( $user =~ /viewUser\/(\S+)\" .*>(.+)</ ) {
	    my $userDO = {
		username => $1,
		fullName => $2,
	    };
	    bless $userDO, 'userMonitoringRow';
	    push @{ $list->{ dataRows } }, $userDO;
	}
    }

    return ( $ans == 200 ? $list : undef );

}

# http://ctf54a.speers.nu/sf/sfmain/do/customEventHandlers/?refresh=true
sub refreshEvents {
    my $self = shift;
    my $form = {
	action => '/sf/sfmain/do/customEventHandlers/',
	fields => {
	    refresh => 'true',
	},
    };

    my $ans = $self->submitForm($form);
    return ( $ans == 200 ? 1 : undef );

}

sub submitForm {
    my $self = shift;
    my $form = shift;
    my $type = ( shift(@_) ? 'form-data' : 'application/x-www-form-urlencoded' );
    my $file = shift;

    $form->{method} ||= 'GET';   # Set default method

    my($req,$query);
    my $uri  = new URI $self->{host}->as_string;

    $uri->path($form->{action});

    if ( $form->{method} eq 'GET' ) {
	if ( exists($form->{fields})) {
	    $query = join('&', map { $_ . '=' . $form->{fields}->{$_} } keys(%{$form->{fields}}));
	    $uri->query($query);
	}
	$req = GET($uri->as_string);
    }

    if ( $form->{method} eq 'POST') {
	$uri->query( $form->{querystring} ) if (exists($form->{querystring}));
	$req = POST($uri->as_string,
		    Content_Type => $type,
		    Content      => [ %{$form->{fields}} ]);
    }

    $self->{request}     = $req;
    $self->{response}    = $self->ua->request($req,$file);
    $self->{form}        = $form;

    return $self->{response}->code;

}

sub response { $_[0]->{ response } }

package userMonitoringList;
use TeamForge::Types::List;
@ISA =qw(TeamForge::Types::List);

package userMonitoringRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

1;
