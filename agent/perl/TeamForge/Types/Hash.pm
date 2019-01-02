
package TeamForge::Types::Hash;

use vars qw($AUTOLOAD);

sub new {

    my $class = shift;
    my $ref   = ( ref($_[0]) ) ? shift(@_) : { @_ };
    my $self  = {
	data  => $ref,
	ident => $class,
	};
    
    bless $self, $class;

    return $self;

}

sub ident {
    my $self  = shift;
    my $value = shift;

    $self->{ ident } = $value if ( defined($value));
    return $self->{ ident };
}

sub simpleHash {
    my $self = shift;
    my $struct = $self->structure();
    my $ref    = $self->{ data };
    my @keys   = keys( %$ref );
    my $key    = $keys[0] || return undef;
    
    return {
	$struct->{ key   }->{ name  } => $key,
	$struct->{ value }->{ name  } => $ref->{ $key } 
    };

}

sub prepareOne {
    my $self   = shift;
    my $key    = shift;
    my $ref    = $self->{ data };
    my @keys   = keys( %$ref );
    my $struct = $self->structure();
    my $isa    = ref($self);

    $key ||= $keys[0];

    return undef unless ( $key );

    return SOAP::Data
	    ->name( $isa )
	    ->value( [ SOAP::Data
		       ->name( $struct->{ key }->{ name  } )
		       ->value( $key )
		       ->type(  $struct->{ key }->{ type } ),
		       SOAP::Data
		       ->name( $struct->{ value }->{ name } )
		       ->value( $ref->{ $key } )
		       ->type(  $struct->{ value }->{ type } ) 
		       ]) 
	    ->attr({'xsi:type' => sprintf("tns1:%s", $isa ) });
    
}

sub prepare {
    my $self   = shift;
    my $field  = shift || $self->ident ;
    my $struct = $self->structure();
    my $ref    = $self->{ data };

    my @list;
    for my $key (keys(%$ref)) {
	push @list, $self->prepareOne( $key ) ;
    }

    return SOAP::Data
	->name( $field )
	->value( \@list )
	->attr({'soapenc:arrayType' => sprintf('tns1:%s[%s]', $isa, ( $#list + 1 )) });

}


sub AUTOLOAD {
    my $method = substr($AUTOLOAD, rindex($AUTOLOAD, '::') + 2);
    return if $method eq 'DESTROY';

    my $self  = shift;
    my $value = shift;

    if ( exists( $self->{ data }->{ $method } ) ) {
	if ( defined( $value ) ) {
	    $self->{ data }->{ $method } = $value;
	}
	return $self->{ data }->{ $method };
    }
    return undef;
}

1;
