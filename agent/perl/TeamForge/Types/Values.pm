
package TeamForge::Types::Values;

use SOAP::Lite;

# The data structure CTF returns is rather odd and hard to manage.
# The fix method converts the CTF data object to someting more
# manageable, however each of the convenience methods in this package
# will need to flip the object class over to the new style.

sub new {
    my $class = shift;
    my $ref   = shift;
    my (@names,@values);

    for my $key (keys(%$ref)) {
	push @names,  $key;
	push @values, $ref->{ $key };
    }
    
    my $self = {
	names  => \@names,
	values => \@values,
    };

    bless $self, $class;
    $self->fix;
    return $self;
}

sub fix {
    my $self  = shift;
    my $ident = ref($self);
    my $ct    = 0;
    my $idx   = {};

    for my $field (@{$self->{names}}) {
	if ( !defined( $idx->{ $field } ) ) {
	    $idx->{ $field } = {
		cursor => 0,
		ident  => $ident,
		type   => '',
		vals   => [],
	    };
	    if ( $ident eq 'SoapFieldValues' ) {
		$idx->{ $field }->{ type } = $self->{'types'}->[ $ct ];
	    }
	}
	if ( ref( $self->{'values'}->[ $ct ] ) ) {
	    push @{ $idx->{ $field }->{ vals } }, @{ $self->{'values'}->[ $ct ] };
	} else {
	    push @{ $idx->{ $field }->{ vals } }, $self->{'values'}->[ $ct ];
	}

	$ct++;
    }

    for my $key (keys(%$self)) {
	delete $self->{ $key };
    }

    for my $key (keys(%$idx)) {
	$self->{ $key } = $idx->{ $key };
    }

    bless $self, 'TeamForge::Types::Values::idx';
}

sub getFieldList {
    my $self  = shift; $self->fix;
    return $self->getFieldList;
}

sub field {
    my $self  = shift; $self->fix;
    return $self->field( @_ );

}

sub type {
    my $self  = shift; $self->fix;
    return $idx->type( @_ );
}

sub prepare {
    my $self = shift; $self->fix;
    $self->prepare( @_ );
}

package TeamForge::Types::Values::idx;

our %enc = (
    Date   => 'xsd:dateTime',
    String => 'soapenc:string',
);

sub prepare {
    my $self  = shift;
    my $field = shift;

    my($ident,@names,@types,@values);

    for my $key (keys(%$self)) {
	$ident = $self->{ $key }->{ ident };
	for my $val ($self->field( $key )) {

	    my $type = $self->type($key) || 'String';
	    my $enc  = $enc{ $type }     || 'soapenc:string';

	    push @names, SOAP::Data
		->name('names')
		->value($key)
		->attr({'xsi:type' => 'soapenc:string'});

	    push @types, SOAP::Data
		->name('types')
		->value( $type )
	        ->attr({'xsi:type' => 'soapenc:string'}) if ( $ident eq 'SoapFieldValues');

	    push @values, SOAP::Data
		->name('values')
		->value( $val )
		->attr({'xsi:type' => $enc });
	}
    }

    my ($name,$type,$value);

    $name = SOAP::Data
	->name('names')
	->value(\@names)
	->attr({ 'soapenc:arrayType' => 'soapenc:string[' . ( $#names + 1 ) . ']', 'xsi:type' => "soapenc:Array"});

    $type = SOAP::Data
	->name('types')
	->value(\@types)
	->attr({ 'soapenc:arrayType' => 'soapenc:string[' . ( $#types + 1 ) . ']', 'xsi:type' => "soapenc:Array"});

    $value = SOAP::Data
	->name('values')
	->value(\@values)
	->attr({ 'soapenc:arrayType' => 'xsd:anyType[' . ( $#values + 1 ) . ']', 'xsi:type' => "soapenc:Array"});

    if ( $ident eq 'SoapFieldValues') {
	return SOAP::Data
	    ->name($field => \SOAP::Data->value($name, $type, $value))
	    ->attr({ 
		'xsi:type' => "tns1:SoapFieldValues"
		   });
    } else {
	return SOAP::Data
	    ->name($field => \SOAP::Data->value($name, $value))
	    ->attr({ 
		'xsi:type' => "tns1:$ident"
		   });
    }
}

sub getFieldList {
    my $self  = shift;
    return keys(%$self);
}

sub field {
    my $self  = shift;
    my $key   = shift;
    my @args  = @_;

    if ( exists( $self->{ $key } ) ) {
	if ( $#args > -1 ) {
	    if ( ref( $_[0] ) ) {
		$self->{ $key }->{ vals } = $_[0];
	    } else {
		$self->{ $key }->{ vals } = [ @args ];
	    }
	}
	return wantarray ? @{ $self->{ $key }->{ vals } } : ${ $self->{ $key }->{ vals } }[0];
    }
    return undef;

}

sub type {
    my $self  = shift;
    my $key   = shift;
    my $value = shift;

    if ( exists( $self->{ $key } ) ) {
	if ( $value ) {
	    $self->{ $key }->{ type } = $value;
	}
	return $self->{ $key }->{ type };
    }
    return undef;
    
}

1;

