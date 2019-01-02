

package TeamForge;

=head1 NAME

TeamForge - Perl SDK Convenience Kit

=head1 SYNOPSIS

       use TeamForge;
       $ctf = TeamForge->new(
	    proxy => 'http://forge.mysite.org',
       );

       # Setting your TeamForge server.
       $ctf->proxy('https://sfee.open.collab.net');

       # Get the current SDK Version
       print $ctf->sdkVersion;

       # Get a SOAP Session key.
       $session = $ctf->login('user','password');

       # Tracker Access
       $trackers = $ctf->TrackerApp->getTrackerList($session,'proj1000');

         or

       $tapp     = $ctf->TrackerApp;
       $tracker  = $tapp->getTrackerData($session,'tracker1016');
       $artifact = $tapp->getArtifactData($session,'artf1018');
       
       $artifact->title("New Title");

       $ctf->setError('raise');  # make exceptions fatal.
       $ctf->setError('print');  # exceptions sent to STDERR

=head1 DESCRIPTION

This is the Perl SDK kit for Collabnet TeamForge 5.x.  The Kit
provides a set of perl modules to make working with the TeamForge API
quicker and easier than writing your own SOAP::Lite calls.

Basic documentation for each of the available services is also
provided.

=head1 DEFAULT HOST

  http://localhost:8080

This is the default host that this SDK will contact when no hostname
is specified with the proxy method.  While it is possible to use
different TeamForge hosts, they must all support the Collabnet
TeamForge SOAP API Version 5.0 or greater to use this kit.

=head1 CONNECTING TO OTHER HOSTS

   $ctf->proxy("http://otherhost.com");

To connect to a host other than the default, use the proxy method to
specify the target TeamForge server.

With a SOAP based API the proxy method is referring to the server
where the SOAP service is hosted, not a local proxy that you navigate
to get there.

=head1 HANDLING ERRORS

By default when the TeamForge server generates an error, no action is
taken by the Perl SDK. You can set the desired action with the
setError method of the main TeamForge object.

     $ctf->setError('print');  # Prints the error.
     $ctf->setError('raise');  # uses the die function with the error.

When raising exceptions it is a good practice to catch them using the
eval function:

     eval {
	$list = $ctf->TrackerApp->getArtifactList( $sk, $tracker->id );
     };
     if ( $@ ) {
	printf "ERROR: %s\n", $@;
     }

=head2 Custom Error Handling

If you prefer to use your own callback for exceptions you can specify
the method for the package to call with the on_fault method:

    $ctf->on_fault( \&handle_error );

    sub handle_error {

        my $soap  = shift;
	my $res   = shift;

	print ref $res ? $res->faultstring : $soap->transport->status, "\n";

    }

=head1 INFORMATION METHODS

=over 4

=item sdkVersion()

Returns the version number of the Perl SDK.

=item getServiceList()

Returns an array listing all of the current SOAP API services.  These
can then be used to get the list of methods in those services.

      @services = $ctf->getServiceList();
      for my $svc (@services) {
         @methods = $ctf->$svc->methods();
         # do something with @methods.
      }

=item methods()

      $methods = $ctf->methods;
      for $method (keys(%$methods)) {
         printf "%s\n", $method;
      }

        or

     $methods = $ctf->TrackerApp->methods;

For any service object it is possible to get a list of available
methods for that service.  The returned hashref describes the entire
call as supported by this SDK.

=item describe()

      $args = $ctf->describe('login');
      for $arg (@$args) {
	  printf "%-25s: %s\n", $arg->name, $arg->type;
      }

For any method you can get the parameter list available for that
method.  This is returned as an array reference, and each element of
the array is a SOAP::Data object.

=back

=head1 EXTRA SERVICES

See the TeamForge::Extra module for a description of addtional Methods
provided by this Perl SDK that are there to help augment what the
native CTF SOAP API provides.  For example:

  monitorObject
  stopMonitoringObject
  getUsersMonitoringObject
  refreshEvents

=head1 WORKING WITH DATA OBJECTS

The TeamForge API uses standard data types and some custom data types.
There are many custom data types, but they all use the same basic
interface, so working with them is actually rather easy.

These custom types fall into a few simple types: DO, List, Row and
Value.

There is also one object type that must be created locally and is
often used to in List type methods: SoapFilter.  See the details
below.

=head2 DO

A DO object type is used to represent a single data object, and
frequently that object is needed to save changes to that data object
on the server.  For example, when you use the getArtifactData method,
you will get an ArtifactSoapDO object type.

To get or set a value in a DO object, use the field name as a method
on that object:

   print $artifact->title;
   $artifact->title("My new Title");

When you make a change to a DO object, it is still only in local
memory, it hasn't been changed on the server yet.  Any DO objects that
can be saved will have a set version of the get method used to fetch
that object.

   $artifact = $ctf->TrackerApp->getArtifactData($sk,'artf1001');
   $artifact->title("New Title");
   $artifact->status("Closed");
   $ctf->TrackerApp->setArtifactData($sk,$artifact,$comment,$attachFilename,$attachType,$fileId);

After you call a set method, be sure to re-get the DO object before tyring
to update it again.

Sometimes a DO will use extended fields for more complex data
than what can fit in a single DO field.  For example, Trackers can
define flex fields.  To get/set a flex field you have to provide the
field with the flex field name.

   print $artifact->flexFields->field('Test Text');
   $artifact->flexFields->field('Test Text',"New Value");

Note that "flexFields" for an artifact is a SoapFieldValues object.
See the C<SoapFieldValues> section below for more.

=over 4

=item getFieldList

Getting the list of fields for a DO object:

   print join(',',$artifact->getFieldList);

=item showType

To see what the data type is for a specific field:

   print $artifact->showType('title');

=back

=head2 List

Some methods return a list of objects.  Those will be a List type
object.  To make using these List objects easier, there are some
standard methods.

   $list = $ctf->TrackerApp->getArtifactList($session,'tracker1001',$filter);

When using a List method, the entire result set is returned to your
client before the method returns.  So if the result set is 100
objects, all 100 will be loaded into your program's memory.  There are
exceptions, such as the TrackerApp->getArtifactDetailList method which
allows you to specify the start and end row numbers to return.  If you
tell it to start with row 100 and end at 110, the returned object will
be rows 0 - 10.

=over 4

=item count

   $list->count

Returns the raw count of objects returned in the call (0 is the first row).

=item fetchrow

   while($row = $list->fetchrow) {
     print $row->id;
   }

Provides a cursor type feature that allows you to iterate over the
items in the list.

=item reset

   $list->reset;

Resets the cursor to the first item in the list.

=item getrow

   $row = $list->getrow(10);

Returns a specifc row from the list.

=back

=head2 Row

     $row = $list->getrow(10);
     print $row->id;

A row object is what is returned from the fetchrow and getrow methods
in a List object.  These objects are very similar to the DO object
type (internally the are the same).  But a Row object cannot be used
with any of the set methods.  They also tend to be less complete than
the real DO object for that item.  

You must still get the real DO object if you need to change something,
Row objects are only useful in a read-only mode (even though you can
change them).

=head2 Values, SoapNamedValues, SoapFieldValues

   $data = SoapNamedValues->new( { key => "value",
                                   key2 => [ @values ] });

   $data->field('key',  $value );
   $data->field('key2', @values);

   $data->type('key','String');   # Only for SoapFieldValues objects.

A number of DO objects and API methods that will use field these
"Value" object types to extend how a fixed SOAP field can be used.
flexFields in an ArtifactSoapDO is a good example of this.

There are two versions of this Values object type: SoapFieldValues,
SoapNamedValues.

They are both basically the same, but SoapFieldValues has an added data
type parameter for each field in the object.

   $flexfields = $artifact->flexFields;

   print $flexfields->field("My Field");
   print $flexfields->type("My Field");  # only works for SoapFieldValues

To set either a field value or field type, add a second argument to
the above methods with the new value:

   $flexfields->field("My Field","New Value");
   $flexfields->type("My Field", "String");

=head2 SoapFilter

   $filter = SoapFilter->new( field => value, ... );
   $filter = SoapFilter->new( $hashref );

   # A status Class filter.
   $filter = SoapFilter->new( statusClass => 'Open' );
   $filter->statusClass('Closed');

Soap Filters are used for List methods to limit the result sets
returned by those methods.  They work much like filters in the Web
Interface.  Filters are additive.  You cannot define "OR" or ranges of
data with a filter.

   $list = $ctf->TrackerApp->getArtifatList($session,'tracker1001',$filter);

For a list of filterable fields see the Constants list futher down this page.

Scroll down to the object type you expect to be working with.  For
example, if you are looking for tasks, A TaskSoapDO is the object
type.  In the TaskSoapDO table, the constant names in the seccond
column that start with FILTER_ are the valid filter fields for that
type.  The third column is the string literal to use in the Perl SDK
SoapFilter method.

A sample from the TaskSoapDO table:

   java.lang.String       FILTER_CREATED_BY  "createdBy"
   java.lang.String       FILTER_STATUS      "status" 

To create a filter for these fields, do this:

   $filter = new SoapFilter { createdBy => 'username', status => "Closed" };

   $tasks = $tf->TaskApp->getTaskList($sk,$project->id,$filter);

   while( $task = $tasks->fetchrow ) {
      printf "%s: %s\n", $task->id, $task->title;
   }

=head2 SortKeys

   $sortkeys = SortKeys->new( title => 0, ... );
   $sortkeys = SortKeys->new( $hashref );

   # set Ascending order to true.
   $sortkeys->title(1);

Some methods take a SortKeys object to determine the order that the
results are returned from TeamForge in.  This method takes a list of
key/value pairs.  The keys are field names that appear in the
resulting Row object, the value is a boolean flag ( 0 or 1 ) that
tells TeamForge if the sort should be ascending.

=over

=item ident()

    $array->ident('string');

The array object auto types itself based on the reference name of the
first object you place in the list.  Use this method if you need to
change the Array object name.

=back

=head1 TROUBLESHOOTING

If you need to see the serialized XML that the SDK intends to send
before it is sent, you can call the SOAP::Lite serializer.

   $data = $ctf->TrackerApp->getArtifactData( $skey, $artifact );
   print SOAP::Serializer->autotype(0)->readable(1)->serialize( $data->prepare );

The prepare method for DO, Soap*Values, SortKeys and SoapFilter
objects needs to be called so that they are formatted for SOAP::Lite.

=head1 SERVICES

For each of the main SOAP services there is a separate manual page and
access method.  This is a list of the available services and the name
of manual page to see for details.

   use TeamForge;

   $tf = new TeamForge;  # see TeamForge::CollabNet for $tf methods.

=over 4


=item $svc = $sfee->CategorizationApp;

    See TeamForge::CategorizationApp

=item $svc = $sfee->CollabNet;

    See TeamForge::CollabNet

=item $svc = $sfee->DiscussionApp;

    See TeamForge::DiscussionApp

=item $svc = $sfee->DocumentApp;

    See TeamForge::DocumentApp

=item $svc = $sfee->FileStorageApp;

    See TeamForge::FileStorageApp

=item $svc = $sfee->FrsApp;

    See TeamForge::FrsApp

=item $svc = $sfee->IntegrationDataApp;

    See TeamForge::IntegrationDataApp

=item $svc = $sfee->NewsApp;

    See TeamForge::NewsApp

=item $svc = $sfee->PageApp;

    See TeamForge::PageApp

=item $svc = $sfee->PlanningApp;

    See TeamForge::PlanningApp

=item $svc = $sfee->PluggableApp;

    See TeamForge::PluggableApp

=item $svc = $sfee->RbacApp;

    See TeamForge::RbacApp

=item $svc = $sfee->ScmApp;

    See TeamForge::ScmApp

=item $svc = $sfee->ScmListenerService;

    See TeamForge::ScmListenerService

=item $svc = $sfee->SimpleFileStorageApp;

    See TeamForge::SimpleFileStorageApp

=item $svc = $sfee->TaskApp;

    See TeamForge::TaskApp

=item $svc = $sfee->TrackerApp;

    See TeamForge::TrackerApp

=item $svc = $sfee->WikiApp;

    See TeamForge::WikiApp



=back


=head1 FILTER CONSTANTS

Filters are specified based on the final Data Object that would be
called.  The SOAP API tries to be consistent in the way List and Data
objects are called.  For example, the getArtifactData3,
getArtifactList3, getArtifactDetailList3, and setArtifactData3 methods
are intended to be used together.  So when you use the SoapFilter for
the getArtifactList3 method, you should use the filter spec for an
ArtifactSoapDO3 object.

=over

=cut

use TeamForge::CategorizationApp;
use TeamForge::CollabNet;
use TeamForge::DiscussionApp;
use TeamForge::DocumentApp;
use TeamForge::FileStorageApp;
use TeamForge::FrsApp;
use TeamForge::IntegrationDataApp;
use TeamForge::NewsApp;
use TeamForge::PageApp;
use TeamForge::PlanningApp;
use TeamForge::PluggableApp;
use TeamForge::RbacApp;
use TeamForge::ScmApp;
use TeamForge::ScmListenerService;
use TeamForge::SimpleFileStorageApp;
use TeamForge::TaskApp;
use TeamForge::TrackerApp;
use TeamForge::WikiApp;

our $VERSION = "2.4-4a";
@ISA = qw(TeamForge::CollabNet);

sub sdkVersion { return "2.4-4a"; }
sub getServiceList { return qw!CategorizationApp CollabNet DiscussionApp DocumentApp FileStorageApp FrsApp IntegrationDataApp NewsApp PageApp PlanningApp PluggableApp RbacApp ScmApp ScmListenerService SimpleFileStorageApp TaskApp TrackerApp WikiApp!; }


use TeamForge::Extra;

sub sfproxy {
	my $self = shift;
	my $obj  = shift;
	my $endpoint;
	eval { $endpoint = $self->transport->endpoint; };
	if ( $endpoint ) {
		$obj->proxy($endpoint);
                $obj->on_fault( $self->on_fault );
	}
}

sub raise_error {
    my $soap  = shift;
    my $res   = shift;

    die ref $res ? $res->faultstring : $soap->transport->status, "\n";
}

sub print_error {
    my $soap  = shift;
    my $res   = shift;

    print ref $res ? $res->faultstring : $soap->transport->status, "\n";
}

sub setError { 
    my $self = shift;
    my $type = shift;
    $self->on_fault( \&print_error ) if ( $type eq "print");
    $self->on_fault( \&raise_error ) if ( $type eq "raise");
    return $self->on_fault;
}

sub Extra { my $obj = TeamForge::Extra->new( $_[0] ); $obj }

sub CategorizationApp  { my $obj = TeamForge::CategorizationApp->new(); sfproxy($_[0],$obj); $obj }
sub CollabNet  { my $obj = TeamForge::CollabNet->new(); sfproxy($_[0],$obj); $obj }
sub DiscussionApp  { my $obj = TeamForge::DiscussionApp->new(); sfproxy($_[0],$obj); $obj }
sub DocumentApp  { my $obj = TeamForge::DocumentApp->new(); sfproxy($_[0],$obj); $obj }
sub FileStorageApp  { my $obj = TeamForge::FileStorageApp->new(); sfproxy($_[0],$obj); $obj }
sub FrsApp  { my $obj = TeamForge::FrsApp->new(); sfproxy($_[0],$obj); $obj }
sub IntegrationDataApp  { my $obj = TeamForge::IntegrationDataApp->new(); sfproxy($_[0],$obj); $obj }
sub NewsApp  { my $obj = TeamForge::NewsApp->new(); sfproxy($_[0],$obj); $obj }
sub PageApp  { my $obj = TeamForge::PageApp->new(); sfproxy($_[0],$obj); $obj }
sub PlanningApp  { my $obj = TeamForge::PlanningApp->new(); sfproxy($_[0],$obj); $obj }
sub PluggableApp  { my $obj = TeamForge::PluggableApp->new(); sfproxy($_[0],$obj); $obj }
sub RbacApp  { my $obj = TeamForge::RbacApp->new(); sfproxy($_[0],$obj); $obj }
sub ScmApp  { my $obj = TeamForge::ScmApp->new(); sfproxy($_[0],$obj); $obj }
sub ScmListenerService  { my $obj = TeamForge::ScmListenerService->new(); sfproxy($_[0],$obj); $obj }
sub SimpleFileStorageApp  { my $obj = TeamForge::SimpleFileStorageApp->new(); sfproxy($_[0],$obj); $obj }
sub TaskApp  { my $obj = TeamForge::TaskApp->new(); sfproxy($_[0],$obj); $obj }
sub TrackerApp  { my $obj = TeamForge::TrackerApp->new(); sfproxy($_[0],$obj); $obj }
sub WikiApp  { my $obj = TeamForge::WikiApp->new(); sfproxy($_[0],$obj); $obj }



package SortKeys;
use TeamForge::Types::Hash;
@ISA = qw(TeamForge::Types::Hash);

sub structure {
  return {
       key   => { name => 'name',      type => 'xsd:string'  },
       value => { name => 'ascending', type => 'xsd:boolean' },
  };
}

package SoapFilter;
use TeamForge::Types::Hash;
@ISA = qw(TeamForge::Types::Hash);

sub structure {
  return {
       key   => { name => 'name',      type => 'xsd:string'  },
       value => { name => 'value',     type => 'xsd:string' },
  };
}

1;
package AdapterDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    adapterParamTypes    => 'com.vasoftware.sf.server.types.NamedValue[]',
    adapterParams        => 'com.vasoftware.sf.server.types.NamedValue[]',
  };
}

sub filters {
  return {
  };
}

package AdapterList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package AdapterRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package Artifact2SoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    autosumming          => 'boolean',
    priority             => 'int',
    remainingEffort      => 'int',
    actualEffort         => 'int',
    flexFields           => 'SoapFieldValues',
    estimatedEffort      => 'int',
  };
}

sub filters {
  return {
    FILTER_RESOLVED_IN_RELEASE_TITLE    => 'resolvedInReleaseTitle',
    FILTER_SUBMITTED_BEFORE             => 'submittedBefore',
    FILTER_TITLE                        => 'title',
    FILTER_REPORTED_IN_RELEASE_TITLE    => 'reportedInReleaseTitle',
    FILTER_PRIORITY                     => 'priority',
    FILTER_REMAINING_EFFORT             => 'remainingEffort',
    FILTER_PLANNING_FOLDER_ID           => 'planningFolderId',
    FILTER_STATUS                       => 'status',
    FILTER_SUBMITTED_BY                 => 'submittedBy',
    FILTER_MODIFIED_AFTER               => 'modifiedAfter',
    FILTER_MODIFIED_BEFORE              => 'modifiedBefore',
    FILTER_CUSTOMER                     => 'customer',
    FILTER_ESTIMATED_EFFORT             => 'estimatedEffort',
    FILTER_GROUP                        => 'group',
    FILTER_ASSIGNED_TO                  => 'assignedTo',
    FILTER_CATEGORY                     => 'category',
    FILTER_STATUS_CLASS                 => 'statusClass',
    FILTER_AUTOSUMMING                  => 'autosumming',
    FILTER_SUBMITTED_AFTER              => 'submittedAfter',
    FILTER_ACTUAL_EFFORT                => 'actualEffort',
  };
}

=item Artifact2SoapDO

    resolvedInReleaseTitle    Filter name for resolved in release title column name.
    submittedBefore           Filter name for submitted before.
    title                     Filter name for title.
    reportedInReleaseTitle    Filter name for reported in release title column name.
    priority                  Filter name for priority.
    remainingEffort           Filter name for remaining effort.
    planningFolderId          Filter name for planning folder id.
    status                    Filter name for status.
    submittedBy               Filter name for submittedBy.
    modifiedAfter             Filter name for modified after.
    modifiedBefore            Filter name for modified before.
    customer                  Filter name for customer.
    estimatedEffort           Filter name for estimated effort.
    group                     Filter name for group.
    assignedTo                Filter name for assignedTo.
    category                  Filter name for category.
    statusClass               Filter name for status class.
    autosumming               Filter name for autosumming.
    submittedAfter            Filter name for submitted after.
    actualEffort              Filter name for actual effort.

=cut Artifact2SoapDO

package Artifact2SoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package Artifact2SoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package Artifact3SoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    autosumming          => 'boolean',
    priority             => 'int',
    remainingEffort      => 'int',
    actualEffort         => 'int',
    flexFields           => 'SoapFieldValues',
    points               => 'int',
    estimatedEffort      => 'int',
  };
}

sub filters {
  return {
    FILTER_RESOLVED_IN_RELEASE_TITLE    => 'resolvedInReleaseTitle',
    FILTER_SUBMITTED_BEFORE             => 'submittedBefore',
    FILTER_TITLE                        => 'title',
    FILTER_REPORTED_IN_RELEASE_ID       => 'reportedInReleaseId',
    FILTER_POINTS                       => 'points',
    FILTER_RESOLVED_IN_RELEASE_ID       => 'resolvedInReleaseId',
    FILTER_REPORTED_IN_RELEASE_TITLE    => 'reportedInReleaseTitle',
    FILTER_PRIORITY                     => 'priority',
    FILTER_REMAINING_EFFORT             => 'remainingEffort',
    FILTER_PLANNING_FOLDER_ID           => 'planningFolderId',
    FILTER_STATUS                       => 'status',
    FILTER_SUBMITTED_BY                 => 'submittedBy',
    FILTER_MODIFIED_AFTER               => 'modifiedAfter',
    FILTER_MODIFIED_BEFORE              => 'modifiedBefore',
    FILTER_CUSTOMER                     => 'customer',
    FILTER_ESTIMATED_EFFORT             => 'estimatedEffort',
    FILTER_GROUP                        => 'group',
    FILTER_ASSIGNED_TO                  => 'assignedTo',
    FILTER_CATEGORY                     => 'category',
    FILTER_STATUS_CLASS                 => 'statusClass',
    FILTER_AUTOSUMMING                  => 'autosumming',
    FILTER_SUBMITTED_AFTER              => 'submittedAfter',
    FILTER_ACTUAL_EFFORT                => 'actualEffort',
  };
}

=item Artifact3SoapDO

    resolvedInReleaseTitle    Filter name for resolved in release title column name.
    submittedBefore           Filter name for submitted before.
    title                     Filter name for title.
    reportedInReleaseId       Filter name for reported in release id column name.
    points                    Filter name for points.
    resolvedInReleaseId       Filter name for resolved in release id column name.
    reportedInReleaseTitle    Filter name for reported in release title column name.
    priority                  Filter name for priority.
    remainingEffort           Filter name for remaining effort.
    planningFolderId          Filter name for planning folder id.
    status                    Filter name for status.
    submittedBy               Filter name for submittedBy.
    modifiedAfter             Filter name for modified after.
    modifiedBefore            Filter name for modified before.
    customer                  Filter name for customer.
    estimatedEffort           Filter name for estimated effort.
    group                     Filter name for group.
    assignedTo                Filter name for assignedTo.
    category                  Filter name for category.
    statusClass               Filter name for status class.
    autosumming               Filter name for autosumming.
    submittedAfter            Filter name for submitted after.
    actualEffort              Filter name for actual effort.

=cut Artifact3SoapDO

package Artifact3SoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package Artifact3SoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package ArtifactDependency2SoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package ArtifactDependency2SoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package ArtifactDependencySoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package ArtifactDependencySoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package ArtifactDetail2SoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package ArtifactDetail2SoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package ArtifactDetail3SoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package ArtifactDetail3SoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package ArtifactDetailSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package ArtifactDetailSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package ArtifactSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    priority             => 'int',
    flexFields           => 'SoapFieldValues',
    actualHours          => 'int',
    estimatedHours       => 'int',
  };
}

sub filters {
  return {
    FILTER_STATUS                       => 'status',
    FILTER_SUBMITTED_BY                 => 'submittedBy',
    FILTER_MODIFIED_AFTER               => 'modifiedAfter',
    FILTER_MODIFIED_BEFORE              => 'modifiedBefore',
    FILTER_CUSTOMER                     => 'customer',
    FILTER_GROUP                        => 'group',
    FILTER_RESOLVED_IN_RELEASE_TITLE    => 'resolvedInReleaseTitle',
    FILTER_ASSIGNED_TO                  => 'assignedTo',
    FILTER_SUBMITTED_BEFORE             => 'submittedBefore',
    FILTER_CATEGORY                     => 'category',
    FILTER_TITLE                        => 'title',
    FILTER_STATUS_CLASS                 => 'statusClass',
    FILTER_SUBMITTED_AFTER              => 'submittedAfter',
    FILTER_REPORTED_IN_RELEASE_TITLE    => 'reportedInReleaseTitle',
    FILTER_PRIORITY                     => 'priority',
  };
}

=item ArtifactSoapDO

    status                    Filter name for status.
    submittedBy               Filter name for submittedBy.
    modifiedAfter             Filter name for modified after.
    modifiedBefore            Filter name for modified before.
    customer                  Filter name for customer.
    group                     Filter name for group.
    resolvedInReleaseTitle    Filter name for resolved in release title column name.
    assignedTo                Filter name for assignedTo.
    submittedBefore           Filter name for submitted before.
    category                  Filter name for category.
    title                     Filter name for title.
    statusClass               Filter name for status class.
    submittedAfter            Filter name for submitted after.
    reportedInReleaseTitle    Filter name for reported in release title column name.
    priority                  Filter name for priority.

=cut ArtifactSoapDO

package ArtifactSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package ArtifactSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package ArtifactsInPlanningFolder2SoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package ArtifactsInPlanningFolder2SoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package ArtifactsInPlanningFolderSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package ArtifactsInPlanningFolderSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package AssociationSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package AssociationSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package Attachment2SoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package Attachment2SoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package AttachmentSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package AttachmentSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package AuditHistorySoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package AuditHistorySoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package CategorySoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package CategorySoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package CategorySoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package CommentSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package CommentSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package CommitSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    files                => 'ScmFileSoapList',
  };
}

sub filters {
  return {
    FILTER_CREATED_AFTER                => 'createdAfter',
    FILTER_CREATED_BEFORE               => 'createdBefore',
    FILTER_CREATED_BY                   => 'createdBy',
  };
}

=item CommitSoapDO

    createdAfter              Scm commit created date filter.
    createdBefore             Scm commit created date filter.
    createdBy                 Scm commit 'createdBy' filter.

=cut CommitSoapDO

package CommitSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package CommitSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package DocumentFolderSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package DocumentFolderSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package DocumentFolderSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package DocumentReviewSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    version              => 'int',
    documentVersion      => 'int',
  };
}

sub filters {
  return {
  };
}

package DocumentReviewSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package DocumentReviewSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package DocumentSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    currentVersion       => 'int',
    fileSize             => 'long',
    documentVersion      => 'int',
    latestVersion        => 'int',
  };
}

sub filters {
  return {
    FILTER_REVIEW_STATUS                => 'status',
    FILTER_REVIEW_CREATED_BY            => 'createdBy',
  };
}

=item DocumentSoapDO

    status                    Document review 'status' filter.
    createdBy                 Document review 'createdBy' filter.

=cut DocumentSoapDO

package DocumentSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package DocumentSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package ExternalSystemDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    adapterParamTypes    => 'com.vasoftware.sf.server.types.NamedValues',
    adapterParams        => 'com.vasoftware.sf.server.types.NamedValues',
  };
}

sub filters {
  return {
  };
}

package ExternalSystemList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package ExternalSystemRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package ExternalSystemStatusList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package ExternalSystemStatusRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package FolderSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package FolderSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package ForumSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    listEnabled          => 'boolean',
  };
}

sub filters {
  return {
  };
}

package ForumSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package ForumSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package FrsFileSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    size                 => 'long',
  };
}

sub filters {
  return {
  };
}

package FrsFileSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package FrsFileSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package Group2SoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package Group2SoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package GroupSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package GroupSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package GroupSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package LinkPluggableComponentSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package LinkPluggableComponentSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package NewsPostSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package NewsPostSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package NewsPostSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package PackageSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    isPublished          => 'boolean',
    downloaded           => 'int',
  };
}

sub filters {
  return {
  };
}

package PackageSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package PackageSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package PageComponentSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    visiblity            => 'int',
    settings             => 'SoapNamedValues',
  };
}

sub filters {
  return {
  };
}

package PageSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    visible              => 'boolean',
  };
}

sub filters {
  return {
  };
}

package PageSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package PageSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package PlanningFolder2SoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    endDate              => 'date',
    startDate            => 'date',
    capacity             => 'int',
  };
}

sub filters {
  return {
  };
}

package PlanningFolder2SoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package PlanningFolder2SoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package PlanningFolderSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    endDate              => 'date',
    startDate            => 'date',
  };
}

sub filters {
  return {
  };
}

package PlanningFolderSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package PlanningFolderSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package PlanningFolderSummary2SoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    openPriority5        => 'int',
    openPoints           => 'int',
    openPriority4        => 'int',
    remainingPriority3   => 'int',
    remainingPriority5   => 'int',
    actualEffortSummary  => 'int',
    estimatedPriority2   => 'int',
    remainingEffortSummary => 'int',
    actualPriority5      => 'int',
    actualPriority0      => 'int',
    openPriority0        => 'int',
    remainingPriority4   => 'int',
    openPriority1        => 'int',
    totalOpen            => 'int',
    endDate              => 'date',
    startDate            => 'date',
    closedPoints         => 'int',
    actualPriority4      => 'int',
    remainingPriority0   => 'int',
    actualPriority1      => 'int',
    estimatedPriority4   => 'int',
    estimatedPriority1   => 'int',
    openPriority3        => 'int',
    totalClosed          => 'int',
    estimatedPriority3   => 'int',
    estimatedPriority0   => 'int',
    actualPriority2      => 'int',
    estimatedPriority5   => 'int',
    capacity             => 'int',
    openPriority2        => 'int',
    actualPriority3      => 'int',
    estimatedEffortSummary => 'int',
    remainingPriority2   => 'int',
    remainingPriority1   => 'int',
  };
}

sub filters {
  return {
  };
}

package PlanningFolderSummary2SoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package PlanningFolderSummary2SoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package PlanningFolderSummarySoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    openPriority5        => 'int',
    openPriority4        => 'int',
    remainingPriority0   => 'int',
    actualPriority1      => 'int',
    remainingPriority3   => 'int',
    estimatedPriority4   => 'int',
    estimatedPriority1   => 'int',
    remainingPriority5   => 'int',
    openPriority3        => 'int',
    totalClosed          => 'int',
    estimatedPriority3   => 'int',
    actualEffortSummary  => 'int',
    estimatedPriority0   => 'int',
    estimatedPriority2   => 'int',
    remainingEffortSummary => 'int',
    actualPriority2      => 'int',
    actualPriority0      => 'int',
    actualPriority5      => 'int',
    openPriority0        => 'int',
    estimatedPriority5   => 'int',
    remainingPriority4   => 'int',
    openPriority1        => 'int',
    openPriority2        => 'int',
    actualPriority3      => 'int',
    remainingPriority2   => 'int',
    estimatedEffortSummary => 'int',
    endDate              => 'date',
    totalOpen            => 'int',
    startDate            => 'date',
    actualPriority4      => 'int',
    remainingPriority1   => 'int',
  };
}

sub filters {
  return {
  };
}

package PlanningFolderSummarySoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package PlanningFolderSummarySoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package PlanningStatusValueSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    isDefault            => 'boolean',
  };
}

sub filters {
  return {
  };
}

package PluggableComponentParameterSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    options              => 'com.collabnet.ce.soap50.webservices.pluggable.PluggableComponentParameterValueSoapDO[]',
    maxLength            => 'int',
    editable             => 'boolean',
  };
}

sub filters {
  return {
  };
}

package PluggableComponentParameterValueSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package PluggableComponentSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    configParameters     => 'com.collabnet.ce.soap50.webservices.pluggable.PluggableComponentParameterSoapDO[]',
    permissions          => 'com.collabnet.ce.soap50.webservices.pluggable.PluggablePermissionSoapDO[]',
    enabled              => 'boolean',
  };
}

sub filters {
  return {
  };
}

package PluggableComponentSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package PluggableComponentSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package PluggablePermissionSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package PostSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package PostSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package PostSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package ProjectMemberSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package ProjectMemberSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package ProjectSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package ProjectSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package ProjectSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package RankedArtifactSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package RankedArtifactSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package RelationshipSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package ReleaseSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    downloaded           => 'int',
  };
}

sub filters {
  return {
  };
}

package ReleaseSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package ReleaseSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package Repository2SoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    idRequiredOnCommit   => 'boolean',
    hideMonitoringDetails => 'boolean',
    isOnManagedScmServer => 'boolean',
  };
}

sub filters {
  return {
  };
}

package RepositorySoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    idRequiredOnCommit   => 'boolean',
    isOnManagedScmServer => 'boolean',
  };
}

sub filters {
  return {
  };
}

package RepositorySoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package RepositorySoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package RoleClusterSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package RoleClusterSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package RoleGroupSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package RoleGroupSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package RoleSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package RoleSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package RoleSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package ScmFileSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package ScmFileSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package SoapFieldValues;
use TeamForge::Types::Values;
@ISA = qw(TeamForge::Types::Values);

package SoapNamedValues;
use TeamForge::Types::Values;
@ISA = qw(TeamForge::Types::Values);

package TaskGroupSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    overdueTasks         => 'boolean',
  };
}

sub filters {
  return {
  };
}

package TaskGroupSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package TaskGroupSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package TaskSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    priority             => 'int',
    requiredHours        => 'int',
    includeWeekends      => 'boolean',
    estimatedHours       => 'int',
  };
}

sub filters {
  return {
    FILTER_STATUS                       => 'status',
    FILTER_ASSIGNED_TO                  => 'assignedTo',
    FILTER_PRIORITY                     => 'priority',
    FILTER_CREATED_BY                   => 'createdBy',
  };
}

=item TaskSoapDO

    status                    Filter name for status.
    assignedTo                Filter name for assignedTo.
    priority                  Filter name for priority.
    createdBy                 Filter name for createdBy.

=cut TaskSoapDO

package TaskSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package TaskSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package TopicSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    viewCount            => 'int',
  };
}

sub filters {
  return {
  };
}

package TopicSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package TopicSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package Tracker2SoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    assignments          => 'SoapNamedValues',
  };
}

sub filters {
  return {
  };
}

package Tracker2SoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package Tracker2SoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package TrackerField2SoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    defaultUsernames     => 'String[]',
    disabled             => 'boolean',
    required             => 'boolean',
    fieldValues          => 'TrackerFieldValueSoapDO[]',
    displayLines         => 'int',
    hiddenOnCreate       => 'boolean',
    displaySize          => 'int',
  };
}

sub filters {
  return {
  };
}

package TrackerFieldSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    defaultUsernames     => 'String[]',
    disabled             => 'boolean',
    required             => 'boolean',
    fieldValues          => 'TrackerFieldValueSoapDO[]',
    displayLines         => 'int',
    hiddenOnCreate       => 'boolean',
    displaySize          => 'int',
  };
}

sub filters {
  return {
  };
}

package TrackerFieldValueSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    isDefault            => 'boolean',
  };
}

sub filters {
  return {
  };
}

package TrackerSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    assignments          => 'SoapNamedValues',
  };
}

sub filters {
  return {
  };
}

package TrackerSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package TrackerSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package User2SoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    superUser            => 'boolean',
    restrictedUser       => 'boolean',
  };
}

sub filters {
  return {
    FILTER_STATUS                       => 'status',
    FILTER_USERNAME                     => 'username',
    FILTER_LICENSE_TYPE                 => 'licenseType',
  };
}

=item User2SoapDO

    status                    Filter name for status.
    username                  Filter name for username.
    licenseType               Filter name for license.

=cut User2SoapDO

package User2SoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package User2SoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package UserSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    superUser            => 'boolean',
    restrictedUser       => 'boolean',
  };
}

sub filters {
  return {
  };
}

package UserSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package UserSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package VersionInformationSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package VersionInformationSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package WikiPageSoapDO;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
    dateVersionCreated   => 'date',
    wikiPageVersion      => 'int',
  };
}

sub filters {
  return {
  };
}

package WikiPageSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package WikiPageSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}

package WorkflowTransitionSoapList;
use TeamForge::Types::List;
@ISA = qw(TeamForge::Types::List);

package WorkflowTransitionSoapRow;
use TeamForge::Types::DO;
@ISA = qw(TeamForge::Types::DO);

sub types {
  return {
  };
}

sub filters {
  return {
  };
}


=back

=cut

1;
