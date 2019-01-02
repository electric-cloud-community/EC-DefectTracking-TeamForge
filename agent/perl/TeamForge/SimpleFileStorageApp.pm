package TeamForge::SimpleFileStorageApp;

# Modifed by Dan Speers of Collabnet for the perlsdk kit for TeamForge
# -- generated by SOAP::Lite (v0.712) for Perl -- soaplite.com -- Copyright (C) 2000-2001 Paul Kulchenko --
# -- generated from https://forge.collab.net/ce-soap50/services/SimpleFileStorageApp?wsdl [Mon Nov 15 16:37:51 2010]

=head1 NAME

TeamForge::SimpleFileStorageApp - Collabnet TeamForge API

=head1 METHODS

=over 4

=item endFileUpload()


=over

=item Arguments

      sessionId             => xsd:string
      fileId                => xsd:string


Since 4.1

=back



Closes and saves uploaded file.



----

=item getSize()


=over

=item Arguments

      sessionId             => xsd:string
      fileId                => xsd:string


Returns File size in number of bytes.

Since 4.1

=back



Returns size of the specified file in bytes.



----

=item read()


=over

=item Arguments

      sessionId             => xsd:string
      fileId                => xsd:string
      offset                => xsd:int
      length                => xsd:int


Returns Data read from the file as a byte array. Returns null on file end.

Since 4.1

=back



Reads from file a specified a number of bytes from the offset
specified.



----

=item startFileUpload()


=over

=item Arguments

      sessionId             => xsd:string


Returns File descriptor key.

Since 4.1

=back



Provides SOAP web service for uploading/downloading files. Uploaded
files are assigned a "tempoary session-specific key" which must be used
within the SOAP session to create a document/FRS file/etc. Otherwise,
the uploaded file is simply discarded. This service is primarily meant
for clients which are unable to use SOAP file attachments for
uploading/downloading files. Uploading/downloading files as attachments
is much more efficient than returning them in memory. The
"FileStorageApp" service provides support for uploading/downloading
files as attachments.

B<Change History>

I<Version 4.3>: No changes.

Opens a new file descriptor for uploading.



----

=item write()


=over

=item Arguments

      sessionId             => xsd:string
      fileId                => xsd:string
      data                  => xsd:base64Binary


Since 4.1

=back



Appends data to the file being uploaded.



----

=back

=cut

my %methods = (
  startFileUpload => {
    endpoint => 'http://localhost:8080/ce-soap50/services/SimpleFileStorageApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'xsd:string', attr => {}),
    ],
  },
  endFileUpload => {
    endpoint => 'http://localhost:8080/ce-soap50/services/SimpleFileStorageApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'fileId', type => 'xsd:string', attr => {}),
    ],
  },
  read => {
    endpoint => 'http://localhost:8080/ce-soap50/services/SimpleFileStorageApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'fileId', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'offset', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'length', type => 'xsd:int', attr => {}),
    ],
  },
  getSize => {
    endpoint => 'http://localhost:8080/ce-soap50/services/SimpleFileStorageApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'fileId', type => 'xsd:string', attr => {}),
    ],
  },
  write => {
    endpoint => 'http://localhost:8080/ce-soap50/services/SimpleFileStorageApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'fileId', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'data', type => 'xsd:base64Binary', attr => {}),
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
