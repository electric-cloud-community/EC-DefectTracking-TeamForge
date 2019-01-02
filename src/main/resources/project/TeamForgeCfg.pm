####################################################################
#
# ECDefectTracking::TeamForge::Cfg: Object definition of a TeamForge Defect Tracking configuration.
#
####################################################################
package ECDefectTracking::TeamForge::Cfg;
@ISA = (ECDefectTracking::Base::Cfg);
if (!defined ECDefectTracking::Base::Cfg) {
    require ECDefectTracking::Base::Cfg;
}

####################################################################
# Object constructor for ECDefectTracking::TeamForge::Cfg
#
# Inputs
#   cmdr  = a previously initialized ElectricCommander handle
#   name  = a name for this configuration
####################################################################
sub new {
    my $class = shift;

    my $cmdr = shift;
    my $name = shift;

    my($self) = ECDefectTracking::Base::Cfg->new($cmdr,"$name");
    bless ($self, $class);
    return $self;
}


####################################################################
# TeamForgePORT
####################################################################
sub TeamForgePORT {
    my ($self) = @_;
    return $self->get("TeamForgePORT");
}
sub setTeamForgePORT {
    my ($self, $name) = @_;
    print "Setting TeamForgePORT to $name\n";
    return $self->set("TeamForgePORT", "$name");
}

####################################################################
# Credential
####################################################################
sub getCredential {
    my ($self) = @_;
    return $self->get("Credential");
}
sub setCredential {
    my ($self, $name) = @_;
    print "Setting Credential to $name\n";
    return $self->set("Credential", "$name");
}

####################################################################
# validateCfg
####################################################################
sub validateCfg {
    my ($class, $pluginName, $opts) = @_;

foreach my $key (keys % {$opts}) {
	print "\nkey=$key, val=$opts->{$key}\n";
}

}


1;
