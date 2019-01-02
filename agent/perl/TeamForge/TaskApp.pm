package TeamForge::TaskApp;

# Modifed by Dan Speers of Collabnet for the perlsdk kit for TeamForge
# -- generated by SOAP::Lite (v0.712) for Perl -- soaplite.com -- Copyright (C) 2000-2001 Paul Kulchenko --
# -- generated from https://forge.collab.net/ce-soap50/services/TaskApp?wsdl [Mon Nov 15 16:37:52 2010]

=head1 NAME

TeamForge::TaskApp - Collabnet TeamForge API

=head1 METHODS

=over 4

=item createTask()


=over

=item Arguments

      sessionId             => soapenc:string
      taskGroupId           => soapenc:string
      title                 => soapenc:string
      description           => soapenc:string
      priority              => xsd:int
      userAssignedTo        => soapenc:string
      status                => soapenc:string
      startDate             => xsd:dateTime
      endDate               => xsd:dateTime
      estimatedHours        => xsd:int
      requiredHours         => xsd:int
      includeWeekends       => xsd:boolean


Returns Task object.

Since 4.1

=back



Creates a new task with the specified information.

I<Version 4.2>

=over

=item * New parameter (C<includeWeekends>) added.

=back



----

=item createTaskDependency()


=over

=item Arguments

      sessionId             => soapenc:string
      originTaskId          => soapenc:string
      targetTaskId          => soapenc:string


Since 4.1

=back



Create a task dependency.



----

=item createTaskGroup()


=over

=item Arguments

      sessionId             => soapenc:string
      parentId              => soapenc:string
      title                 => soapenc:string
      description           => soapenc:string


Returns Newly created task group object.

Since 4.1

=back



Creates a new task group.



----

=item deleteTask()


=over

=item Arguments

      sessionId             => soapenc:string
      taskId                => soapenc:string


Since 4.1

=back



Deletes a task.



----

=item deleteTaskDependency()


=over

=item Arguments

      sessionId             => soapenc:string
      originTaskId          => soapenc:string
      targetTaskId          => soapenc:string


Since 4.1

=back



Delete a task dependency.



----

=item deleteTaskGroup()


=over

=item Arguments

      sessionId             => soapenc:string
      taskGroupId           => soapenc:string


Since 4.1

=back



Deletes a task group.



----

=item findTasks()


=over

=item Arguments

      sessionId             => soapenc:string
      queryString           => soapenc:string
      projectId             => soapenc:string
      searchAttachments     => xsd:boolean


Returns List of tasks matching search criteria.

Since 4.1

=back



Finds a list of tasks matching a search string.



----

=item getPredecessorTaskList()


=over

=item Arguments

      sessionId             => soapenc:string
      targetTaskId          => soapenc:string


Returns List of predecessor tasks

Since 4.2

=back



Return a list of tasks on which the task is dependent ("predecessors").

NOTE: Replaces listPredecessorTasks() in 4.1.



----

=item getSuccessorTaskList()


=over

=item Arguments

      sessionId             => soapenc:string
      originTaskId          => soapenc:string


Returns List of successor tasks

Since 4.2

=back



Return a list of tasks which are dependent on the task ("successors").

NOTE: Replaces listSuccessorTasks() in 4.1.



----

=item getTaskData()


=over

=item Arguments

      sessionId             => soapenc:string
      taskId                => soapenc:string


Returns the task data associated with the task at the given path

Since 4.1

=back



Returns data associated with the specified task.



----

=item getTaskGroupData()


=over

=item Arguments

      sessionId             => soapenc:string
      taskGroupId           => soapenc:string


Returns the task group data associated with the task at the given path

Since 4.1

=back



Returns data associated with the specified task group.



----

=item getTaskGroupList()


=over

=item Arguments

      sessionId             => soapenc:string
      parentId              => soapenc:string


Returns List of task groups within the project.

Since 4.1

=back



Provides SOAP services for managing user tasks.

B<Change History>

I<Version 5.3>

=over

=item * All methods taking I<SoapFilter>

arguments now support ORing filter conditions if multiple I<SoapFilter>
objects with the same name but different values are passed.

=back

I<Version 5.2>

=over

=item * I<createTask>: Times are no longer stripped off from startDate
and endDate before storing internally. In other words, we no longer
convert these times to midnight.

=item * I<setTaskData>: Times are no longer stripped off from startDate
and endDate before storing internally. In other words, we no longer
convert these times to midnight.

=back

Returns a list of task groups for a project (in the correct order).



----

=item getTaskList()


=over

=item Arguments

      sessionId             => soapenc:string
      containerId           => soapenc:string
      filters               => impl:ArrayOf_tns1_SoapFilter


Returns Filtered list of tasks within the project or task group.

Since "4.1"

=back



Returns a filtered list of tasks within a given project or task group.

B<Change History>

I<Version 4.2>

=over

=item * Added additional parameter (C<filters>) for filtering task
lists.

=back



----

=item hasTasksWithPendingChanges()


=over

=item Arguments

      sessionId             => soapenc:string
      taskGroupId           => soapenc:string


Returns true if a folder has any items with pending changes under it, false otherwise

Since 4.1

=back



Return true if a folder has any items with pending changes under it.



----

=item moveTask()


=over

=item Arguments

      sessionId             => soapenc:string
      taskId                => soapenc:string
      targetTaskGroupId     => soapenc:string


Returns the task group data for the updated group.

Since 4.1

=back



Moves a task.



----

=item moveTaskGroup()


=over

=item Arguments

      sessionId             => soapenc:string
      taskGroupId           => soapenc:string
      targetTaskGroupId     => soapenc:string


Returns the task group data for the updated group.

Since 4.1

=back



Moves a task group.



----

=item renameTaskGroup()


=over

=item Arguments

      sessionId             => soapenc:string
      taskGroupId           => soapenc:string
      newTitle              => soapenc:string


Returns the task group data for the updated group.

Since 4.1

=back



Renames a task group.



----

=item reorderTaskGroups()


=over

=item Arguments

      sessionId             => soapenc:string
      parentFolderId        => soapenc:string
      taskGroupIds          => impl:ArrayOf_xsd_string


Since 4.1

=back



Set a new order for the task groups (folders) in a parent folder. The
task groups will be listed in this new order in UI.



----

=item setTaskData()


=over

=item Arguments

      sessionId             => soapenc:string
      taskData              => tns1:TaskSoapDO
      comment               => soapenc:string


Since 4.1

=back



Returns data associated with the specified task.

I<Version 4.2>

=over

=item * TaskSoapDO has a new member field (C<includeWeekends>).

=back



----

=back

=cut

my %methods = (
  findTasks => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'queryString', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'projectId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'searchAttachments', type => 'xsd:boolean', attr => {}),
    ],
  },
  getTaskGroupList => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'parentId', type => 'soapenc:string', attr => {}),
    ],
  },
  createTaskGroup => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'parentId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'title', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'description', type => 'soapenc:string', attr => {}),
    ],
  },
  getTaskData => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'taskId', type => 'soapenc:string', attr => {}),
    ],
  },
  createTaskDependency => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'originTaskId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'targetTaskId', type => 'soapenc:string', attr => {}),
    ],
  },
  deleteTaskGroup => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'taskGroupId', type => 'soapenc:string', attr => {}),
    ],
  },
  getPredecessorTaskList => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'targetTaskId', type => 'soapenc:string', attr => {}),
    ],
  },
  moveTaskGroup => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'taskGroupId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'targetTaskGroupId', type => 'soapenc:string', attr => {}),
    ],
  },
  getSuccessorTaskList => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'originTaskId', type => 'soapenc:string', attr => {}),
    ],
  },
  deleteTaskDependency => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'originTaskId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'targetTaskId', type => 'soapenc:string', attr => {}),
    ],
  },
  moveTask => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'taskId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'targetTaskGroupId', type => 'soapenc:string', attr => {}),
    ],
  },
  createTask => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'taskGroupId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'title', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'description', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'priority', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'userAssignedTo', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'status', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'startDate', type => 'xsd:dateTime', attr => {}),
      SOAP::Data->new(name => 'endDate', type => 'xsd:dateTime', attr => {}),
      SOAP::Data->new(name => 'estimatedHours', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'requiredHours', type => 'xsd:int', attr => {}),
      SOAP::Data->new(name => 'includeWeekends', type => 'xsd:boolean', attr => {}),
    ],
  },
  hasTasksWithPendingChanges => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'taskGroupId', type => 'soapenc:string', attr => {}),
    ],
  },
  setTaskData => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'taskData', type => 'tns1:TaskSoapDO', attr => {}),
      SOAP::Data->new(name => 'comment', type => 'soapenc:string', attr => {}),
    ],
  },
  getTaskList => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'containerId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'filters', type => 'impl:ArrayOf_tns1_SoapFilter', attr => {}),
    ],
  },
  renameTaskGroup => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'taskGroupId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'newTitle', type => 'soapenc:string', attr => {}),
    ],
  },
  getTaskGroupData => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'taskGroupId', type => 'soapenc:string', attr => {}),
    ],
  },
  deleteTask => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'taskId', type => 'soapenc:string', attr => {}),
    ],
  },
  reorderTaskGroups => {
    endpoint => 'http://localhost:8080/ce-soap50/services/TaskApp',
    soapaction => '',
    uri => '',
    parameters => [
      SOAP::Data->new(name => 'sessionId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'parentFolderId', type => 'soapenc:string', attr => {}),
      SOAP::Data->new(name => 'taskGroupIds', type => 'impl:ArrayOf_xsd_string', attr => {}),
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