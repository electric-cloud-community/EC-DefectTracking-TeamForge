package TeamForge::WikiApp;

# Modifed by Dan Speers of Collabnet for the perlsdk kit for TeamForge
# -- generated by SOAP::Lite (v0.712) for Perl -- soaplite.com -- Copyright (C) 2000-2001 Paul Kulchenko --
# -- generated from https://forge.collab.net/ce-soap50/services/WikiApp?wsdl [Mon Nov 15 16:37:55 2010]

=head1 NAME

TeamForge::WikiApp - Collabnet TeamForge API

=head1 METHODS

=over 4

=item addAttachment()


=over

=item Arguments

      sessionId             => soapenc:string
      wikiPageId            => soapenc:string
      fileId                => soapenc:string
      filename              => soapenc:string
      mimetype              => soapenc:string


Since 4.3

=back



Attaches the uploaded file to the specified wiki page. The attachment
file id is retunred by one of the file storage services to upload the
file (e.g. FileStorageApp or SimpleFileStorageApp service).



----

=item createWikiPage()


=over

=item Arguments

      sessionId             => soapenc:string
      projectId             => soapenc:string
      name                  => soapenc:string
      wikiText              => soapenc:string
      versionComment        => soapenc:string


Returns Wiki page data object.

Since 4.3

=back



Provides SOAP web service for wiki application.

B<Change History>

I<Version 4.4>: No changes.

Creates a new wiki page with the specified name, text, etc.



----

=item deleteWikiPage()


=over

=item Arguments

      sessionId             => soapenc:string
      wikiPageId            => soapenc:string


Since 4.3

=back



Deletes a wiki page.



----

=item getFormattedWikiPageText()


=over

=item Arguments

      sessionId             => soapenc:string
      wikiPageId            => soapenc:string


Returns Wiki page text in formatted form.

Since 4.3

=back



Get specified wiki page text in formatted (HTML) form.



----

=item getWikiPageData()


=over

=item Arguments

      sessionId             => soapenc:string
      wikiPageId            => soapenc:string


Returns Wiki page data object.

Since 4.3

=back



Get specified wiki page data.



----

=item getWikiPageDataByName()


=over

=item Arguments

      sessionId             => soapenc:string
      projectId             => soapenc:string
      wikiPageName          => soapenc:string


Returns Wiki page text in formatted form.

Since 4.3

=back



Get specified wiki page text in formatted (HTML) form. "HomePage" is
the default Wiki application home page.



----

=item getWikiPageList()


=over

=item Arguments

      sessionId             => soapenc:string
      projectId             => soapenc:string


Returns wiki page list

Since 4.3 SP1 HOTFIX1

=back



List all wiki pages that have contents witihn a project.



----

=item setWikiPageData()


=over

=item Arguments

      sessionId             => soapenc:string
      wikiPageData          => tns1:WikiPageSoapDO


Since 4.3

=back



Sets specified wiki page data.



----

=back

=cut

my %methods = (
  getWikiPageData => {
    endpoint => 'http://localhost:8080/ce-soap50/services/WikiApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'wikiPageId', type => 'soapenc:string', attr => {}),
    ],
  },
  deleteWikiPage => {
    endpoint => 'http://localhost:8080/ce-soap50/services/WikiApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'wikiPageId', type => 'soapenc:string', attr => {}),
    ],
  },
  getWikiPageList => {
    endpoint => 'http://localhost:8080/ce-soap50/services/WikiApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'projectId', type => 'soapenc:string', attr => {}),
    ],
  },
  getWikiPageDataByName => {
    endpoint => 'http://localhost:8080/ce-soap50/services/WikiApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'projectId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'wikiPageName', type => 'soapenc:string', attr => {}),
    ],
  },
  setWikiPageData => {
    endpoint => 'http://localhost:8080/ce-soap50/services/WikiApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'wikiPageData', type => 'tns1:WikiPageSoapDO', attr => {}),
    ],
  },
  addAttachment => {
    endpoint => 'http://localhost:8080/ce-soap50/services/WikiApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'wikiPageId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'fileId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'filename', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'mimetype', type => 'soapenc:string', attr => {}),
    ],
  },
  getFormattedWikiPageText => {
    endpoint => 'http://localhost:8080/ce-soap50/services/WikiApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'wikiPageId', type => 'soapenc:string', attr => {}),
    ],
  },
  createWikiPage => {
    endpoint => 'http://localhost:8080/ce-soap50/services/WikiApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'projectId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'name', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'wikiText', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'versionComment', type => 'soapenc:string', attr => {}),
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