
package TeamForge::Types::List;

sub count {
    my $self = shift;
    return $#{ $self->{ dataRows }};
}

sub reset {
    my $self = shift;
    $self->{ct} = 0;
}

sub getrow {
    my $self = shift;
    my $ct   = shift;

    if ( $ct <= $self->count ) {
	return $self->{ dataRows }->[ $ct ];
    } else {
	return undef;
    }

}

sub fetchrow {
    my $self = shift;
    $self->{ct} ||= 0;
    if ( exists( $self->{ dataRows }->[ $self->{ct} ] ) ) {
	return $self->{ dataRows }->[ $self->{ct}++ ];
    } else {
	return undef;
    }
}

1;
