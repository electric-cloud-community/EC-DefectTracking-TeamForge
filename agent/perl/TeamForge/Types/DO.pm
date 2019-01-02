
package TeamForge::Types::DO;

use SOAP::Lite;

our $AUTOLOAD;

sub prepare {

    my $self  = shift;
    my $types = $self->types;

    for my $key (%$self) {
        if (exists($types->{ $key }) ) {
            if ( $types->{ $key } =~ /Soap(Field|Named)Values/ ) {
		my @flds = $self->{ $key }->getFieldList;
		if ( $#flds > -1 ) {
		    $self->{ $key } = $self->{ $key }->prepare($key);
		} else {
		    $self->{ $key } = undef;
		}
            } else {
                $self->{ $key } = SOAP::Data->type( $types->{$key} )->value( $self->{ $key });
            }
        }
    }

}

sub getFieldList {
    my $self = shift;
    return keys(%$self);
}

sub showType {
    my $self  = shift;
    my $field = shift;
    my $types = $self->types;

    if ( exists($self->{ $field }) ) {
	return $types{ $field } || 'String';
    } else {
	return undef;
    }

}

sub AUTOLOAD {
    my @bits = split(/::/,$AUTOLOAD);
    my $method = $bits[1];

    return 1 if ( $method eq 'DESTROY');

    my $self    = shift;
    my $value   = shift;

    if ( exists($self->{ $method } )) {
	if ( defined($value) ) {
	    $self->{ $method } = $value;
	}
	return $self->{ $method };
    } else {
	return undef;
    }

}

1;
