package TeamForge::ScmListenerService;

# Modifed by Dan Speers of Collabnet for the perlsdk kit for TeamForge
# -- generated by SOAP::Lite (v0.712) for Perl -- soaplite.com -- Copyright (C) 2000-2001 Paul Kulchenko --
# -- generated from https://forge.collab.net/sf-soap/services/ScmListener?wsdl [Mon Nov 15 16:37:50 2010]

=head1 NAME

TeamForge::ScmListenerService - Collabnet TeamForge API

=head1 METHODS

=over 4

=item checkPermission()


=over

=item Arguments

      requestKey            => xsd:string
      permName              => xsd:string
      username              => xsd:string
      password              => xsd:string
      systemId              => xsd:string
      repositoryDirectory   => xsd:string


Returns if the user has access to a repository specified by the systemId and repositoryDirectory

=back



Verify user credentials, and verify access to a repository. This should
be used from external integration access checking.



----

=item checkTriggerPermission()


=over

=item Arguments

      requestKey            => xsd:string
      username              => xsd:string
      systemIdString        => xsd:string
      repositoryPath        => xsd:string




=back



Checks that a user has permission to make a commit to triggers.



----

=item clearBrandingOverrideCache()


=over

=item Arguments

      requestKey            => xsd:string




=back



Clear the branding override cache. Called by data-checkout.py after
updating working copy used by branding.



----

=item createCommit()


=over

=item Arguments

      requestKey            => xsd:string
      username              => xsd:string
      systemIdString        => xsd:string
      repositoryPath        => xsd:string
      logmsg                => xsd:string
      filenames             => impl:ArrayOf_xsd_string
      versions              => impl:ArrayOf_xsd_string
      statuses              => impl:ArrayOf_xsd_string
      refFilenames          => impl:ArrayOf_xsd_string
      refVersions           => impl:ArrayOf_xsd_string
      unifiedDiff           => xsd:string


Returns The commit ID of the commit object created (for multipart creates, as in CVS)

=back



Create a commit object to correspond with a commit from an SCM



----

=item getBrandingExternalSystemId()


=over

=item Arguments

      requestKey            => xsd:string


Returns The External System Id for Branding Repository

=back



Return the External System Id corresponding to the Branding repository.
This is the repository with an adapter category=SCM_INTERNAL



----

=item getRolePaths()


=over

=item Arguments

      requestKey            => xsd:string
      username              => xsd:string
      systemId              => xsd:string
      repositoryName        => xsd:string


Returns a string array of role paths that describes the users access to a repository

=back





----

=item getUsernameFromSession()


=over

=item Arguments

      webSessionId          => xsd:string


Returns String The username for the session or an empty string if the session is invalid

=back



Returns the username associated with the session or an empty string if
the session is invalid.



----

=item getViewVCInformation()


=over

=item Arguments

      webSessionId          => xsd:string
      systemIdString        => xsd:string
      repositoryDir         => xsd:string


Returns a string array containing: project path, repository root path, adapter name, username

=back



Get all the necessary information necessary for the
C<CVSViewCGIServlet> to run.



----

=item getViewerInfoByRepository()


=over

=item Arguments

      webSessionId          => xsd:string
      systemIdString        => xsd:string
      repositoryDir         => xsd:string


Returns a string array containing: project path, repository root path, adapter name

=back



Given a SCM server ID and repository dir on it, figure out to what
project it belongs.



----

=item isValidCommitMessage()


=over

=item Arguments

      requestKey            => xsd:string
      username              => xsd:string
      systemIdString        => xsd:string
      repositoryPath        => xsd:string
      logmsg                => xsd:string


Returns true if the commit message is valid for the repository.

=back



Check to see if the commit message is valid for the repository.



----

=item isValidUser()


=over

=item Arguments

      requestKey            => xsd:string
      username              => xsd:string
      password              => xsd:string


Returns int The code associated with the validation result

=back



Returns whether or not the user and supplied password are legit.



----

=item setAnalysisComplete()


=over

=item Arguments

      blackduckRepositoryId  => xsd:string
      status                => xsd:string




=back



Set a blackduck analysis to a completed state. This also sends out an
email detailing the details of the analysis.



----

=back

=cut

my %methods = (
  getViewerInfoByRepository => {
    endpoint => 'http://localhost:8080/sf-soap/services/ScmListener',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'webSessionId', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'systemIdString', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'repositoryDir', type => 'xsd:string', attr => {}),
    ],
  },
  getBrandingExternalSystemId => {
    endpoint => 'http://localhost:8080/sf-soap/services/ScmListener',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'requestKey', type => 'xsd:string', attr => {}),
    ],
  },
  checkTriggerPermission => {
    endpoint => 'http://localhost:8080/sf-soap/services/ScmListener',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'requestKey', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'username', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'systemIdString', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'repositoryPath', type => 'xsd:string', attr => {}),
    ],
  },
  getViewVCInformation => {
    endpoint => 'http://localhost:8080/sf-soap/services/ScmListener',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'webSessionId', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'systemIdString', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'repositoryDir', type => 'xsd:string', attr => {}),
    ],
  },
  isValidUser => {
    endpoint => 'http://localhost:8080/sf-soap/services/ScmListener',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'requestKey', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'username', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'password', type => 'xsd:string', attr => {}),
    ],
  },
  isValidCommitMessage => {
    endpoint => 'http://localhost:8080/sf-soap/services/ScmListener',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'requestKey', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'username', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'systemIdString', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'repositoryPath', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'logmsg', type => 'xsd:string', attr => {}),
    ],
  },
  createCommit => {
    endpoint => 'http://localhost:8080/sf-soap/services/ScmListener',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'requestKey', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'username', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'systemIdString', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'repositoryPath', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'logmsg', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'filenames', type => 'impl:ArrayOf_xsd_string', attr => {}),
      SOAP::Data->new(name => 'versions', type => 'impl:ArrayOf_xsd_string', attr => {}),
      SOAP::Data->new(name => 'statuses', type => 'impl:ArrayOf_xsd_string', attr => {}),
      SOAP::Data->new(name => 'refFilenames', type => 'impl:ArrayOf_xsd_string', attr => {}),
      SOAP::Data->new(name => 'refVersions', type => 'impl:ArrayOf_xsd_string', attr => {}),
      SOAP::Data->new(name => 'unifiedDiff', type => 'xsd:string', attr => {}),
    ],
  },
  setAnalysisComplete => {
    endpoint => 'http://localhost:8080/sf-soap/services/ScmListener',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'blackduckRepositoryId', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'status', type => 'xsd:string', attr => {}),
    ],
  },
  getUsernameFromSession => {
    endpoint => 'http://localhost:8080/sf-soap/services/ScmListener',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'webSessionId', type => 'xsd:string', attr => {}),
    ],
  },
  clearBrandingOverrideCache => {
    endpoint => 'http://localhost:8080/sf-soap/services/ScmListener',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'requestKey', type => 'xsd:string', attr => {}),
    ],
  },
  getRolePaths => {
    endpoint => 'http://localhost:8080/sf-soap/services/ScmListener',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'requestKey', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'username', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'systemId', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'repositoryName', type => 'xsd:string', attr => {}),
    ],
  },
  checkPermission => {
    endpoint => 'http://localhost:8080/sf-soap/services/ScmListener',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'requestKey', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'permName', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'username', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'password', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'systemId', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'repositoryDirectory', type => 'xsd:string', attr => {}),
    ],
  },
);

use SOAP::Lite;
use Exporter;
use Carp ();
use URI;

use vars qw(@ISA $AUTOLOAD @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter SOAP::Lite);
@EXPORT_OK = (keys %methods);
%EXPORT_TAGS = ('all' => [@EXPORT_OK]);

no strict 'refs';
for my $method (@EXPORT_OK) {
  my %method = %{$methods{$method}};
  *$method = sub {
    my $self = UNIVERSAL::isa($_[0] => __PACKAGE__) 
      ? ref $_[0] ? shift # OBJECT
                  # CLASS, either get self or create new and assign to self
                  : (shift->self || __PACKAGE__->self(__PACKAGE__->new))
      # function call, either get self or create new and assign to self
      : (__PACKAGE__->self || __PACKAGE__->self(__PACKAGE__->new));
    my $endpoint;
    eval {
    	$endpoint = $self->transport->endpoint;
    };
    if ( $endpoint ) {
    	$endpoint = host($method{endpoint},$endpoint);
    } else {
    	$endpoint = $method{endpoint};
    }

    my @templates = @{$method{parameters}};
    my @args;
    for ( my $ct = 0; $ct <= $#_; $ct++ ) {
	my $val  = $_[$ct];
	my $type = $templates[$ct]->type;

	if ( ref($val) && ref($val) ne 'HASH' && ref($val) ne 'ARRAY' ) {
	    $val->prepare()                           if ( $type =~ /^tns1:.*SoapDO$/ );
	    $val = $val->simpleHash                   if ( $type eq 'tns1:SoapFilter' );
	    $val = $val->prepare                      if ( $type eq 'impl:ArrayOf_tns1_SoapFilter' );
	} else {
	    $val = SOAP::Utils::encode_data( $val )   if ( $type =~ /^(xsd|soapenc):string$/ );
	}

	push @args, $templates[$ct]->value( $val );

    }
    $self->proxy($endpoint || Carp::croak "No server address (proxy) specified") unless $self->proxy;
    my $som = $self
      -> endpoint($endpoint)
      -> uri($method{uri})
      -> readable(1)
      -> on_action(sub{qq!"$method{soapaction}"!})
      -> call(SOAP::Data->name('namesp2:'.$method)->attr({'xmlns:namesp2' => 'http://schema.vasoftware.com/sf/soap/service',
							  'xmlns:tns1' => 'http://schema.vasoftware.com/sf/soap/type'}) => 
	      @args);
	      #map {@templates ? shift(@templates)->value($_) : $_} @_); 

    UNIVERSAL::isa($som => 'SOAP::SOM') ? wantarray ? $som->paramsall : $som->result 
                                        : $som;
  }
}

sub AUTOLOAD {
  my $method = substr($AUTOLOAD, rindex($AUTOLOAD, '::') + 2);
  return if $method eq 'DESTROY';

  die "Unrecognized method '$method'. List of available method(s): @EXPORT_OK\n";
}

sub host {
	my $target = new URI shift;   # This is where the WSDL wants to go.
	my $proxy  = new URI shift;	  # This is where the object was instanciated to go.
	
	$proxy->path( $target->path );
	
	return $proxy->as_string;
	
}

sub describe {

    my $self   = shift;
    my $method = shift;

    if ( exists( $methods{ $method } )) {
	return $methods{ $method }->{ parameters };
    }
    return undef;

}

sub methods {
    my $self = shift;
    return \%methods;
}

1;
