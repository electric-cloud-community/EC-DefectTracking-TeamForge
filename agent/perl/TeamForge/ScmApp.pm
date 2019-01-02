package TeamForge::ScmApp;

# Modifed by Dan Speers of Collabnet for the perlsdk kit for TeamForge
# -- generated by SOAP::Lite (v0.712) for Perl -- soaplite.com -- Copyright (C) 2000-2001 Paul Kulchenko --
# -- generated from https://forge.collab.net/ce-soap50/services/ScmApp?wsdl [Mon Nov 15 16:37:49 2010]

=head1 NAME

TeamForge::ScmApp - Collabnet TeamForge API

=head1 METHODS

=over 4

=item addExternalSystem()


=over

=item Arguments

      sessionId             => soapenc:string
      adapterType           => soapenc:string
      title                 => soapenc:string
      description           => soapenc:string
      adapterTypeParameters  => tns1:SoapNamedValues


Returns The GUID of the newly added external system.

Since 5.4

=back



Adds an external system of the given adapter type with its title,
description and respective list of parameters.

=over

=item * Pre-condition: the adapter type and adapter type parameters
must be the ones expected as documented.

=back



----

=item createRepository()


=over

=item Arguments

      sessionId             => soapenc:string
      projectId             => soapenc:string
      externalSystemId      => soapenc:string
      repositoryDirectory   => soapenc:string
      title                 => soapenc:string
      description           => soapenc:string
      idRequiredOnCommit    => xsd:boolean
      comment               => soapenc:string


Returns Repository Data

=back



Creates a new repository in the given SCM server.

Rendered obsolete in 5.2; createRepositoryData2() supports the new
hideMonitoringDetails flag.



----

=item createRepository2()


=over

=item Arguments

      sessionId             => soapenc:string
      projectId             => soapenc:string
      externalSystemId      => soapenc:string
      repositoryDirectory   => soapenc:string
      title                 => soapenc:string
      description           => soapenc:string
      idRequiredOnCommit    => xsd:boolean
      hideMonitoringDetails  => xsd:boolean
      comment               => soapenc:string


Returns Repository Data

Since 5.2

=back



Creates a new repository in the given SCM server



----

=item getCommitData()


=over

=item Arguments

      sessionId             => soapenc:string
      commitId              => soapenc:string


Returns Commit data.

Since 4.1

=back



Returns data associated with a specific commit. Only files that are
visible through roles or path based permission are included in the
commit data.



----

=item getCommitList()


=over

=item Arguments

      sessionId             => soapenc:string
      repositoryId          => soapenc:string
      filters               => impl:ArrayOf_tns1_SoapFilter


Returns List of SCM commits on the specified repository.

Since 4.1

=back



Lists the commits on a given repository. Note that if a user belongs to
a role that has set up path based permission on a repository, that user
can view all the commits for the repository, even for commits to paths
for which the user does not have view permission (though file details
will be filtered appropriately when getCommitDetails() is called).

B<Change History>

I<Version 4.3>

=over

=item * Added additional parameter C<filters>. The valid filter names
are: createdAfter, createdBefore, createdBy.

=item * The list is always paired down to include no more than 5000
results.

=back



----

=item getRepositoryData()


=over

=item Arguments

      sessionId             => soapenc:string
      repositoryId          => soapenc:string


Returns Repository Data

Since 4.2SP1

=back



Returns data associated with a specific repository

Note that a user has permission to view the repository data if the user
belongs to a role that has either full view permission or any
path-based permission on this repository.

This method is rendered obselete in 5.2; getRepositoryData2() returns
an additional new flag.



----

=item getRepositoryData2()


=over

=item Arguments

      sessionId             => soapenc:string
      repositoryId          => soapenc:string


Returns Repository Data

Since 5.2

=back



Returns data associated with a specific repository Note that a user has
permission to view the repository data if the user belongs to a role
that has either full view permission or any path-based permission on
this repository.



----

=item getRepositoryList()


=over

=item Arguments

      sessionId             => soapenc:string
      projectId             => soapenc:string


Returns List of SCM repositories within the specified project.

Since 4.1

=back



Provides SOAP services for managing the SCM system.

B<Change History>

I<Version 5.4>

=over

=item * Added new method I<moveRepository>.

=item * Added new method I<getScmAdapterNames>.

=item * Added new method I<getScmAdapterParameterNamesWithType>.

=item * Added new method I<addExternalSystem>.

=back

I<Version 5.3>

=over

=item * Added new method I<getSCMCheckoutCommand>.

=item * All methods taking I<SoapFilter> arguments now support ORing
filter conditions if multiple I<SoapFilter> objects with the same name
but different values are passed.

=back

I<Version 5.2>

=over

=item * I<getRepositoryList>: Modified in 5.2 to observe path based
permission.

=item * I<getCommitList>: Modified in 5.2 to observe path based
permission.

=item * I<getCommitData>: Modified in 5.2 to observe path based
permission.

=item * I<getRepositoryData>:Rendered obsolete in 5.2;
getRepositoryData2() returns additional fields. Modified in 5.2 to
observe path based permission.

=item * I<createRepository>:Rendered obsolete in 5.2;
createRepository2() supports additional field.

=item * I<getRepositoryData2>: New operation added in 5.2, to support
new repository field.

=item * I<createRepository2>: New operation added in 5.2, to support
new repository field.

=back

Lists the repositories within a given project that the current user has
been granted view permission through roles and path based permission.
Note that if a user belongs to a role that has set up path based
permission on a repository, that repository will appear in this list.



----

=item getSCMCheckoutCommand()


=over

=item Arguments

      sessionId             => soapenc:string
      repositoryId          => soapenc:string
      userName              => soapenc:string


Returns command to check out the repository

Since 5.3

=back



Returns the command needed to check out a specific repository. Note
that a user has permission to view the checkout command if the user
belongs to a role that has either full view permission or any
path-based permission on this repository.



----

=item getScmAdapterNames()


=over

=item Arguments

      sessionId             => soapenc:string


Returns String[] The known SCM adapter names

Since 5.4

=back



Returns a string array containing the known list of supported SCM
adapters on the server.



----

=item getScmAdapterParameterNamesWithType()


=over

=item Arguments

      sessionId             => soapenc:string
      adapterName           => soapenc:string


Returns SoapNamedValues The named values with type for the SCM adapter

Since 5.4

=back



Returns the SCM adapter parameter names with their corresponding type.



----

=item moveRepository()


=over

=item Arguments

      sessionId             => soapenc:string
      repositoryId          => soapenc:string
      projectId             => soapenc:string


Returns RepositorySoapDO The repository object post-move

Since 5.4

=back



Moves the repository from its current project to the one specified.



----

=back

=cut

my %methods = (
  createRepository => {
    endpoint => 'http://localhost:8080/ce-soap50/services/ScmApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'projectId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'externalSystemId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'repositoryDirectory', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'title', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'description', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'idRequiredOnCommit', type => 'xsd:boolean', attr => {}),
      SOAP::Data->new(name => 'comment', type => 'soapenc:string', attr => {}),
    ],
  },
  createRepository2 => {
    endpoint => 'http://localhost:8080/ce-soap50/services/ScmApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'projectId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'externalSystemId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'repositoryDirectory', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'title', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'description', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'idRequiredOnCommit', type => 'xsd:boolean', attr => {}),
      SOAP::Data->new(name => 'hideMonitoringDetails', type => 'xsd:boolean', attr => {}),
      SOAP::Data->new(name => 'comment', type => 'soapenc:string', attr => {}),
    ],
  },
  getScmAdapterNames => {
    endpoint => 'http://localhost:8080/ce-soap50/services/ScmApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
    ],
  },
  getSCMCheckoutCommand => {
    endpoint => 'http://localhost:8080/ce-soap50/services/ScmApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'repositoryId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'userName', type => 'soapenc:string', attr => {}),
    ],
  },
  getRepositoryData => {
    endpoint => 'http://localhost:8080/ce-soap50/services/ScmApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'repositoryId', type => 'soapenc:string', attr => {}),
    ],
  },
  getScmAdapterParameterNamesWithType => {
    endpoint => 'http://localhost:8080/ce-soap50/services/ScmApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'adapterName', type => 'soapenc:string', attr => {}),
    ],
  },
  getRepositoryList => {
    endpoint => 'http://localhost:8080/ce-soap50/services/ScmApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'projectId', type => 'soapenc:string', attr => {}),
    ],
  },
  getRepositoryData2 => {
    endpoint => 'http://localhost:8080/ce-soap50/services/ScmApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'repositoryId', type => 'soapenc:string', attr => {}),
    ],
  },
  getCommitData => {
    endpoint => 'http://localhost:8080/ce-soap50/services/ScmApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'commitId', type => 'soapenc:string', attr => {}),
    ],
  },
  moveRepository => {
    endpoint => 'http://localhost:8080/ce-soap50/services/ScmApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'repositoryId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'projectId', type => 'soapenc:string', attr => {}),
    ],
  },
  getCommitList => {
    endpoint => 'http://localhost:8080/ce-soap50/services/ScmApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'repositoryId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'filters', type => 'impl:ArrayOf_tns1_SoapFilter', attr => {}),
    ],
  },
  addExternalSystem => {
    endpoint => 'http://localhost:8080/ce-soap50/services/ScmApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'adapterType', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'title', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'description', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'adapterTypeParameters', type => 'tns1:SoapNamedValues', attr => {}),
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
