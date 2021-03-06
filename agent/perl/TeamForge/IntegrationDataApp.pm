package TeamForge::IntegrationDataApp;

# Modifed by Dan Speers of Collabnet for the perlsdk kit for TeamForge
# -- generated by SOAP::Lite (v0.712) for Perl -- soaplite.com -- Copyright (C) 2000-2001 Paul Kulchenko --
# -- generated from https://forge.collab.net/ce-soap50/services/IntegrationDataApp?wsdl [Mon Nov 15 16:37:44 2010]

=head1 NAME

TeamForge::IntegrationDataApp - Collabnet TeamForge API

=head1 METHODS

=over 4

=item getData()


=over

=item Arguments

      sessionId             => soapenc:string
      namespaceId           => soapenc:string
      objectId              => soapenc:string


Returns A SoapNamedValues collection of key/value pair stored data

Since 4.1

=back



Get data for an object from the integration data service



----

=item getDataByKey()


=over

=item Arguments

      sessionId             => soapenc:string
      namespaceId           => soapenc:string
      objectId              => soapenc:string
      key                   => soapenc:string


Returns The value of the stored piece of data

Since 4.3

=back



Get data for an object from the integration data service



----

=item getNamespaceId()


=over

=item Arguments

      sessionId             => soapenc:string
      name                  => soapenc:string


Returns Integration data namespace id

Since 4.1

=back



Get the key to an existing namespace.



----

=item putData()


=over

=item Arguments

      sessionId             => soapenc:string
      namespaceId           => soapenc:string
      objectId              => soapenc:string
      namedValues           => tns1:SoapNamedValues


Since 4.3-HOTFIX1

=back



Add or replace a set of integration data values for the specified
object.



----

=item putDataByKey()


=over

=item Arguments

      sessionId             => soapenc:string
      namespaceId           => soapenc:string
      objectId              => soapenc:string
      key                   => soapenc:string
      value                 => soapenc:string


Since 4.3-HOTFIX1

=back



Add or replace a single integration data value for the specified
object.



----

=item registerNamespace()


=over

=item Arguments

      sessionId             => soapenc:string
      name                  => soapenc:string


Returns Integration data namespace id

Since 4.1

=back



Register a new namespace



----

=item removeData()


=over

=item Arguments

      sessionId             => soapenc:string
      namespaceId           => soapenc:string
      objectId              => soapenc:string
      keys                  => impl:ArrayOf_xsd_string


Since 4.3-HOTFIX1

=back



Remove a set of integration data values from the specified object.



----

=item removeDataByKey()


=over

=item Arguments

      sessionId             => soapenc:string
      namespaceId           => soapenc:string
      objectId              => soapenc:string
      key                   => soapenc:string


Since 4.3-HOTFIX1

=back



Remove a single integration data value from the specified object.



----

=item setData()


=over

=item Arguments

      sessionId             => soapenc:string
      namespaceId           => soapenc:string
      objectId              => soapenc:string
      namedValues           => tns1:SoapNamedValues


Since 4.1

=back



Store data in the integration data service



----

=item setDataByKey()


=over

=item Arguments

      sessionId             => soapenc:string
      namespaceId           => soapenc:string
      objectId              => soapenc:string
      key                   => soapenc:string
      value                 => soapenc:string


Since 4.3

=back



Store data in the integration data service



----

=back

=cut

my %methods = (
  getDataByKey => {
    endpoint => 'http://localhost:8080/ce-soap50/services/IntegrationDataApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'namespaceId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'objectId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'key', type => 'soapenc:string', attr => {}),
    ],
  },
  removeDataByKey => {
    endpoint => 'http://localhost:8080/ce-soap50/services/IntegrationDataApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'namespaceId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'objectId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'key', type => 'soapenc:string', attr => {}),
    ],
  },
  getNamespaceId => {
    endpoint => 'http://localhost:8080/ce-soap50/services/IntegrationDataApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'name', type => 'soapenc:string', attr => {}),
    ],
  },
  removeData => {
    endpoint => 'http://localhost:8080/ce-soap50/services/IntegrationDataApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'namespaceId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'objectId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'keys', type => 'impl:ArrayOf_xsd_string', attr => {}),
    ],
  },
  registerNamespace => {
    endpoint => 'http://localhost:8080/ce-soap50/services/IntegrationDataApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'name', type => 'soapenc:string', attr => {}),
    ],
  },
  putData => {
    endpoint => 'http://localhost:8080/ce-soap50/services/IntegrationDataApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'namespaceId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'objectId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'namedValues', type => 'tns1:SoapNamedValues', attr => {}),
    ],
  },
  putDataByKey => {
    endpoint => 'http://localhost:8080/ce-soap50/services/IntegrationDataApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'namespaceId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'objectId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'key', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'value', type => 'soapenc:string', attr => {}),
    ],
  },
  getData => {
    endpoint => 'http://localhost:8080/ce-soap50/services/IntegrationDataApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'namespaceId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'objectId', type => 'soapenc:string', attr => {}),
    ],
  },
  setData => {
    endpoint => 'http://localhost:8080/ce-soap50/services/IntegrationDataApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'namespaceId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'objectId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'namedValues', type => 'tns1:SoapNamedValues', attr => {}),
    ],
  },
  setDataByKey => {
    endpoint => 'http://localhost:8080/ce-soap50/services/IntegrationDataApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'namespaceId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'objectId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'key', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'value', type => 'soapenc:string', attr => {}),
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
