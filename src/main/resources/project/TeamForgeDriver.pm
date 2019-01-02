####################################################################
#
# ECDefectTracking::TeamForge::Driver  Object to represent interactions with 
#        TeamForge.
#
####################################################################
package ECDefectTracking::TeamForge::Driver;
@ISA = (ECDefectTracking::Base::Driver);
use ElectricCommander;
use Time::Local;
use File::Basename;
use File::Copy;
use File::Path;
use File::Spec;
use File::stat;
use File::Temp;
use FindBin;
use Sys::Hostname;


if (!defined ECDefectTracking::Base::Driver) {
    require ECDefectTracking::Base::Driver;
}

if (!defined ECDefectTracking::TeamForge::Cfg) {
    require ECDefectTracking::TeamForge::Cfg;
}

use strict;
use warnings;

$|=1;

use lib "$ENV{COMMANDER_PLUGINS}/@PLUGIN_NAME@/agent/perl";

use SOAP::Lite +on_fault => \&handle_error; # SOAP::Lite error handler.
use TeamForge;

use constant {
    SUCCESS => 1,
    ERROR => 0,
    
    EXIT_ERROR => 1,
    
    PLUGIN_NAME => 'EC-DefectTracking-TeamForge',
    REPORT_NAME => 'TeamForge Report',
    
    METHOD_LINK_DEFECTS => 'linkDefects',
    METHOD_UPDATE_DEFECTS => 'updateDefects',
    METHOD_FILE_DEFECTS => 'fileDefect',
    METHOD_CREATE_DEFECTS => 'createDefects',
};


####################################################################
# new: Object constructor for ECDefectTracking::TeamForge::Driver
#  
# Side Effects:
#   
# Arguments:
#   cmdr -            previously initialized ElectricCommander handle
#   name -            name of this configuration
#
# Returns:
#   Nothing
#
####################################################################
sub new {
    my $this = shift;
    my $class = ref($this) || $this;

    my $cmdr = shift;
    my $name = shift;

    my $cfg = new ECDefectTracking::TeamForge::Cfg($cmdr, $name);
    if ($name ne "") {
        my $sys = $cfg->getDefectTrackingPluginName();
        if ($sys ne PLUGIN_NAME) { die "DefectTracking config $name is not type ECDefectTracking-TeamForge"; }
    }

    my ($self) = new ECDefectTracking::Base::Driver($cmdr,$cfg);

    bless ($self, $class);
    return $self;
}

####################################################################
# isImplemented
#  
# Side Effects:
#   
# Arguments:
#   self -              the object reference
#   method -            method name
#
# Returns:
#   Nothing
#
####################################################################
sub isImplemented {
    my ($self, $method) = @_;
    
    if ($method eq METHOD_LINK_DEFECTS || 
        $method eq METHOD_UPDATE_DEFECTS ||
        $method eq METHOD_FILE_DEFECTS ||
        $method eq METHOD_CREATE_DEFECTS) {
        return SUCCESS;
    } else {
        return ERROR;
    }
}

####################################################################
# linkDefects
#  
# Side Effects:
#   
# Arguments:
#   self -              the object reference
#   opts -              hash of options
#
# Returns:
#   Nothing
#
####################################################################
sub linkDefects {
    my ($self, $opts) = @_;
    
    # get back a hash ref
    my $defectIDs_ref = $self->extractDefectIDsFromProperty($opts->{propertyToParse}, $opts->{prefix});
    my $prefix = $opts->{prefix};
    print "Prefix: $prefix\n";

    if (! keys % {$defectIDs_ref}) {
        print "No defect IDs found, returning\n";
        return;
    }         

    $self->populatePropertySheetWithDefectIDs($defectIDs_ref);

    my $defectLinks_ref = {}; # ref to empty hash
    
    my $numb;
    
    @$numb = keys %$defectIDs_ref;
    s/$prefix// foreach @$numb;
    
    my ($tf, $sk) = $self->getTeamForgeInstance();
    
    foreach my $e (@$numb){
        print "Defect ID: $e \n";
        my ($name, $url) = $self->queryDefectSystemWithDefectID($tf, $sk, $e);
        
        print "Key: $e Name: $name\n";        
        if ($name && $name ne "" && $url && $url ne "") {
            $defectLinks_ref->{$name} = $url; 
        }
    }
    
    if (keys % {$defectLinks_ref}) {
        $self->populatePropertySheetWithDefectLinks($defectLinks_ref);
        $self->createLinkToDefectReport(REPORT_NAME);
    }
}

####################################################################
# updateDefects
#  
# Side Effects:
#   
# Arguments:
#   self -              the object reference
#   opts -              hash of options
#
# Returns:
#   Nothing
#
####################################################################
sub updateDefects {
    my ($self, $opts) = @_;
    # Attempt to read the property "/myJob/defectsToUpdate" 
    # or the property entered as the "property" parameter to the subprocedure   
    my $property = $opts->{property};    
    if (!$property || $property eq "") {
                print "Error: Property does not exist or is empty\n";
                exit EXIT_ERROR;
    }
    my ($success, $xpath, $msg) = $self->InvokeCommander({SupressLog=>1,IgnoreError=>1}, "getProperty", $property);
        if ($success) {
            my $value = $xpath->findvalue('//value')->string_value;
            $property = $value;
        } else {
            # log the error code and msg
            print "Error querying for $property as a property\n";
            exit EXIT_ERROR;
        }
    # split using ',' to get a list of key=value pairs
    print "Property : $property\n";
    my @pairs = split(',', $property);
    
    my $errors;
    my $updateddefectLinks_ref = {}; # ref to empty hash
    
    #my ($tf, $sk) = $self->getTeamForgeInstance();
    
    foreach my $val (@pairs) {
        print "Current Pair: $val\n";
        my @iDAndValue = split('=', $val);
        # the key of each pair is the defect ID, 
        # e.g. "11111" is the first key in the example above
        my $idDefect = $iDAndValue[0];
        # the value of each pair is the status,
        # e.g. "Resolved", is the first value in the example above
        my $valueDefect = $iDAndValue[1]; 
        #Validate $idDefect $valueDefect
        print "Current idDefect: $idDefect\n";
        print "Current valueDefect: $valueDefect\n";
        if (!$idDefect || $idDefect eq "" || !$valueDefect || $valueDefect eq "" ) {
            print "Error: Property format error\n";
        }else{
            # Call function to resolve Defect               
            my $message = "";
			
			my $tf = new TeamForge;
			$tf->proxy('http://192.168.14.128/');
			$tf->setError('raise');
			my $sk = $tf->login('project_manager','sample'); # Get a session Key			
			
            eval{
                if ($self->defectIdExists($tf,$sk,$idDefect)){			
                    #my $defect = $self->retrieveDefectRecord($tf, $sk, $idDefect);
					my $defect = $tf->TrackerApp->getArtifactData($sk,$idDefect);
					print "SK:$sk\n";
					print "TF:$tf\n";
                    
                    my $originalStatus = $defect->{'status'};
					print "Original Status:$originalStatus \n";
					
                    my $newStatus = $valueDefect;
					print "New Status:$newStatus \n";
                    
                    $defect->status($newStatus);
					print "Defect Status:$defect->{'status'} \n";
                                        
                    my ($success, $xpath, $msg) = $self->InvokeCommander({SupressLog=>1,IgnoreError=>1}, "getProperty", "/myJob/jobId");
                    if ($success) {
                        my $id = $xpath->findvalue('//value')->string_value;
                        $tf->TrackerApp->setArtifactData($sk,$defect,"Updated by ElectricCommander",undef,undef,undef);
						#$tf->TrackerApp->setArtifactData($sk,$artf,"I updated this artifact",undef,undef,undef);
                    }
                    
                    if ($originalStatus eq $defect->{'status'}){
                        $message = "Error: failed trying to update Defect: $idDefect to Status: $newStatus \n";
                        print "$message \n";
                        $updateddefectLinks_ref->{$message} = '#';
                    }else{                        
                        $message = "Defect: $idDefect was successfully updated to $valueDefect status\n";
                        print "$message \n";
                        $updateddefectLinks_ref->{$message} = '#';
                    }
                }else{
                    $message = "Error: failed trying to udpate Defect: $idDefect does not exist \n";
                    print "$message \n";
                    $updateddefectLinks_ref->{$message} = '#';
                    $errors = ERROR;
                }                                
            };
            if ($@) {
                $message = "Error: failed trying to udpate $idDefect to $valueDefect status, with error: $@ \n";
                print "$message \n";
                $errors = ERROR;
            };
        }        
    }    
    
    if (keys % {$updateddefectLinks_ref}) {
        my $propertyName_ref = "updatedDefectLinks"; 
        $self->populatePropertySheetWithDefectLinks($updateddefectLinks_ref, $propertyName_ref);
        $self->createLinkToDefectReport(REPORT_NAME);
    }
    if($errors && $errors ne ""){
        print "Defects update completed with some Errors\n"
    }
}

####################################################################
# createDefects
#  
# Side Effects:
#   
# Arguments:
#   self -              the object reference
#   opts -              hash of options
#
# Returns:
#   Nothing
#
####################################################################
sub createDefects {
    my ($self, $opts) = @_;
    
    my $trackerID = $opts->{trackerID};    
    if (!$trackerID || $trackerID eq "") {
        print "Error: trackerID does not exist or is empty\n";
        exit 1;
    }
    
    #set property jiraProjectName, config for access on File Defect
    my ($success, $xpath, $msg) = $self->InvokeCommander({SuppressLog=>1,IgnoreError=>1},
             "setProperty", "/myJob/trackerID", "$trackerID");
    
    ($success, $xpath, $msg) = $self->InvokeCommander({SuppressLog=>1,IgnoreError=>1},
                     "setProperty", "/myJob/config", "$opts->{config}");
         
    my $mode = $opts->{mode};    
    if (!$mode || $mode eq "") {
        print "Error: mode does not exist or is empty\n";
        exit EXIT_ERROR;
    }
    
    ($success, $xpath, $msg) = $self->InvokeCommander({SupressLog=>1,IgnoreError=>1}, "getProperties", {recurse => "0", path => "/myJob/ecTestFailures"});
    if (!$success) {
        print "No Errors, so no Defects to create\n";
        return 0;       
    }    
    
    my $results = $xpath->find('//property');    
    if (!$results->isa('XML::XPath::NodeSet')) {
        #didn't get a nodeset
        print "Didn't get a NodeSet when querying for property: ecTestFailures \n";
        return 0;   
    }

    my @propsNames = ();
    
    foreach my $context ($results->get_nodelist) {
            my $propertyName = $xpath->find('./propertyName', $context);
            push(@propsNames,$propertyName);    
    }
    
    my $createdDefectLinks_ref = {}; # ref to empty hash
    my $errors;
    
    my ($tf, $sk) = $self->getTeamForgeInstance();
    
    foreach my $prop (@propsNames) {
        print "Trying to get Property /myJob/ecTestFailures/$prop \n";
        my ($jSuccess, $jXpath, $jMsg) = $self->InvokeCommander({SupressLog=>1,IgnoreError=>1}, "getProperties", {recurse => "0", path => "/myJob/ecTestFailures/$prop"});
        
        my %testFailureProps = {}; # ref to empty hash
        
        ##Properties##
        #stepID
        my $stepID = "N/A";             
        #testSuiteName
        my $testSuiteName = "N/A";
        #testCaseResult
        my $testCaseResult = "N/A";
        #testCaseName
        my $testCaseName = "N/A";
        #logs
        my $logs = "N/A";
        #stepName
        my $stepName = "N/A";
        
        my $jResults = $jXpath->find('//property');
        foreach my $jContext ($jResults->get_nodelist) {                        
            my $subPropertyName = $jXpath->find('./propertyName', $jContext)->string_value;
            my $value = $jXpath->find('./value', $jContext)->string_value;
            
            if ($subPropertyName eq 'stepId'){$stepID = $value;}                    
            if ($subPropertyName eq 'testSuiteName'){$testSuiteName = $value;}
            if ($subPropertyName eq 'testCaseResult'){$testCaseResult = $value;}
            if ($subPropertyName eq 'testCaseName'){$testCaseName = $value;}
            if ($subPropertyName eq 'logs'){$logs = $value;}
            if ($subPropertyName eq 'stepName'){$stepName = $value;}                                
        }
        
        my $message = "";               
        my $comment = "Step ID: $stepID "
                    . "Step Name: $stepName "
                    . "Test Case Name: $testCaseName ";
                                        
        if($mode eq "automatic"){
            eval{
                my $defect = $tf->TrackerApp->createArtifact($sk, # SF Session handle
                              $trackerID,                # SF Tracker id
                              "Defect: $prop",           # Title
                              $comment,                  # Description,
                              undef,                     # Group
                              undef,                     # Category
                              'Open',                    # Status
                              undef,                     # Customer
                              1,                         # Priority
                              0,                         # Est. Hours
                              undef,                     # Assign
                              undef
                              );                              
                #print "Defect: $defect->{'id'}";                
                
                if($defect->{'id'}){
                    $message = "Issue Created with ID: ". $defect->{'id'}. "\n";
                    print "$message \n";
                    my $defectUrl = "#";
                    $createdDefectLinks_ref->{$comment} = "$message?url=$defectUrl"; #ie: ?url=http://www.google.com/ig
                }else{
                    $message = "Error: failed trying to create defect\n";
                    print "$message \n";
                    $createdDefectLinks_ref->{$comment} = "$message?prop=$prop";#?prop=Step29721-testBlockUnblock                    
                    $errors = ERROR;
                }                                                   
            };
            if ($@) {
                    $message = "Error: failed trying to create issue, with error: $@ \n";
                    print $message;
                    $errors = ERROR;                            
            };                      
        }else{#$mode eq "manual"
            $createdDefectLinks_ref->{$comment} = "Needs to File Defect?prop=$prop";#?prop=Step29721-testBlockUnblock
        }
    }#end foreach my $prop (@propsNames)
    
    if (keys % {$createdDefectLinks_ref}) {
        my $propertyName_ref = "createdDefectLinks"; 
        $self->populatePropertySheetWithDefectLinks($createdDefectLinks_ref, $propertyName_ref);
        $self->createLinkToDefectReport(REPORT_NAME);
    }    
    if($errors && $errors ne ""){
        print "Created Defects completed with some Errors\n"
    }
}

####################################################################
# fileDefect
#  
# Side Effects:
#   
# Arguments:
#   self -              the object reference
#   opts -              hash of options
#
# Returns:
#   Nothing
#
####################################################################
sub fileDefect {
    my ($self, $opts) = @_;
    
    my $prop = $opts->{prop};    
    if (!$prop || $prop eq "") {
                print "Error: prop does not exist or is empty\n";
                exit EXIT_ERROR;
    }
    
    my $jobIdParam = $opts->{jobIdParam};    
    if (!$jobIdParam || $jobIdParam eq "") {
                print "Error: jobIdParam does not exist or is empty\n";
                exit EXIT_ERROR;
    }
    
    my $trackerIDParam;
    my ($success, $xpath, $msg) = $self->InvokeCommander({SupressLog=>1,IgnoreError=>1}, "getProperty", "trackerID", {jobId => "$jobIdParam"});
    if ($success) {
        $trackerIDParam = $xpath->findvalue('//value')->string_value;     
    } else {
        # log the error code and msg
        print "Error: trackerIDParam does not exist or is empty\n";
        exit 1;
    }
       
    print "Trying to get Property /$jobIdParam/ecTestFailures/$prop \n";    
    my ($jSuccess, $jXpath, $jMsg) = $self->InvokeCommander({SupressLog=>1,IgnoreError=>1}, "getProperties", {recurse => "0", jobId => $jobIdParam, path => "/myJob/ecTestFailures/$prop"});
            
    ##Properties##
    #stepID
    my $stepID = 'N/A';             
    #testSuiteName
    my $testSuiteName = 'N/A';
    #testCaseResult
    my $testCaseResult = 'N/A';
    #testCaseName
    my $testCaseName = 'N/A';
    #logs
    my $logs = 'N/A';
    #stepName
    my $stepName = 'N/A';
    
    my $jResults = $jXpath->find('//property');
    foreach my $jContext ($jResults->get_nodelist) {                        
        my $subPropertyName = $jXpath->find('./propertyName', $jContext)->string_value;
        my $value = $jXpath->find('./value', $jContext)->string_value;
        
        if ($subPropertyName eq 'stepId'){$stepID = $value;}                    
        if ($subPropertyName eq 'testSuiteName'){$testSuiteName = $value;}
        if ($subPropertyName eq 'testCaseResult'){$testCaseResult = $value;}
        if ($subPropertyName eq 'testCaseName'){$testCaseName = $value;}
        if ($subPropertyName eq 'logs'){$logs = $value;}
        if ($subPropertyName eq 'stepName'){$stepName = $value;}                        
    }
    
    my $message = "";               
    my $comment = "Step ID: $stepID "
                . "Step Name: $stepName "
                . "Test Case Name: $testCaseName ";
                
    my ($tf, $sk) = $self->getTeamForgeInstance();
                                    
    eval{
        my $defect = $tf->TrackerApp->createArtifact($sk, # SF Session handle
                      $trackerIDParam,           # SF Tracker id
                      "Defect: $prop",           # Title
                      $comment,                  # Description,
                      undef,                     # Group
                      undef,                     # Category
                      'Open',                    # Status
                      undef,                     # Customer
                      1,                         # Priority
                      0,                         # Est. Hours
                      undef,                     # Assign
                      undef
                      );                              
        #print "Defect: $defect->{'id'}";                  
        
        if($defect->{'id'}){
            $message = "Issue Created with ID: ". $defect->{'id'}. "\n";
            my $defectUrl = "#";
            my $id = $defect->{'id'};
            my ($success, $xpath, $msg) = $self->InvokeCommander({SuppressLog=>1,IgnoreError=>1},
             "setProperty", "/myJob/ecTestFailures/$prop/defectId", $id, {jobId => $jobIdParam});
            ($success, $xpath, $msg) = $self->InvokeCommander({SuppressLog=>1,IgnoreError=>1},
             "setProperty", "/myJob/createdDefectLinks/$comment", "$message?url=$defectUrl", {jobId => $jobIdParam});
        }else{
            $message = "Error: failed trying to create defect\n";
            print "$message \n";
            print "setProperty name: /$jobIdParam/createdDefectLinks/$comment value:$message?prop=$prop \n";
            my ($success, $xpath, $msg) = $self->InvokeCommander({SuppressLog=>1,IgnoreError=>1},
             "setProperty", "/myJob/createdDefectLinks/$comment", "$message?prop=$prop", {jobId => $jobIdParam});
        }  
    };
    if ($@) {
        $message = "Error: failed trying to create issue (EVAL), with error: $@ \n";
        print "$message \n";
        print "setProperty name: /$jobIdParam/createdDefectLinks/$comment value:$message?prop=$prop \n";
        my ($success, $xpath, $msg) = $self->InvokeCommander({SuppressLog=>1,IgnoreError=>1},
             "setProperty", "/myJob/createdDefectLinks/$comment", "$message?prop=$prop", {jobId => $jobIdParam});
    };    
}

####################################################################
# getTeamForgeInstance
#
# Side Effects:
#   
# Arguments:
#   self -              the object reference
#
# Returns:
#   A string with the \collection url
####################################################################
sub getTeamForgeInstance
{
    my ($self) = @_;
    
    my $cfg = $self->getCfg();
    
    my $credentialName = $cfg->getCredential();
    my $credentialLocation = q{/projects/$[/plugins/EC-DefectTracking/project]/credentials/}.$credentialName;

    my ($success, $xPath, $msg) = $self->InvokeCommander({SupressLog=>1,IgnoreError=>1}, "getFullCredential", $credentialLocation);
    if (!$success) {
        print "\nError getting credential\n";
        return;
    }

    my $user = $xPath->findvalue('//userName')->value();
    my $passwd = $xPath->findvalue('//password')->value();

    if (!$user || !$passwd) {
        print "User name and or password in credential $credentialLocation is not set\n";
        return;
    }
    my $host = $cfg->get('host');        
    
    if (!$host) {
        print "The information on configuration is incomplete\n";
        return;
    }
    
    my $tf = new TeamForge;
    $tf->on_fault(\&handle_error); # Define a callback to pass errors to.
    $tf->proxy($host);
	$tf->setError('raise');
    my $sk = $tf -> login($user,$passwd);
    #$log->logdie( "Cannot log on to dest server" ) unless $sk;
    
    #if ($sk eq "1")
        #exit EXIT_ERROR; 

    return ($tf, $sk);
}

####################################################################
# defectIdExists
# Return true if the specified defectId exists in the defect database,
# false otherwise.
#
# Side Effects:
#   
# Arguments:
#   self -              the object reference
#   defectId -          defect ID
#   conn -              TeamForge connection
#
# Returns:
####################################################################
sub defectIdExists {
    my ($self, $tf, $sk, $defectID) = @_;
    
    my $defect = $self->retrieveDefectRecord($tf, $sk, $defectID);
    my $summary = $defect->{'title'};
    my $status = $defect->{'status'};
    
    if($summary || $status){
        return 1;    
    }else{
        return 0;    
    }
}

####################################################################
# retrieveDefectRecord
# Retrieve the specified defect record.
#
# Side Effects:
#   
# Arguments:
#   self -              the object reference
#   defectId -             defect ID
#   conn -              TeamForge connection
#
# Returns:
####################################################################
sub retrieveDefectRecord {
    my ($self, $tf, $sk, $defectID) = @_;
    
    return $tf->TrackerApp->getArtifactData($sk, $defectID);
}

####################################################################
# queryDefectSystemWithDefectID
#
# Side Effects:
#   
# Arguments:
#   self -              the object reference
#   conn -              TeamForge connection
#   defectID -          the defect id to use in the query
#
# Returns:
#   A tuple: (<name of url> , <url pointing to a defect id>)
####################################################################
sub queryDefectSystemWithDefectID {

    my ($self, $tf, $sk, $defectID) = @_;
    
    my $defect;
    my $name; 
    my $url = '#';
    
    $defect = $self->retrieveDefectRecord($tf, $sk, $defectID);
    my $summary = $defect->{'title'};
    my $status = $defect->{'status'};
    
    if($summary || $status){
        $name = "Defect ID: $defectID SUMMARY=$summary, STATUS=$status";    
    }else{
        $name = "Defect ID: $defectID does not exist";    
    }
    
    return ($name, $url);
}

####################################################################
# addConfigItems
# 
# Side Effects:
#   
# Arguments:
#   self -              the object reference
#   opts -              hash of options   
#
# Returns:
#   nothing
####################################################################
sub addConfigItems{
    my ($self, $opts) = @_;

    $opts->{'linkDefects_label'} = REPORT_NAME;
    $opts->{'linkDefects_description'} = 'Generates a report of TeamForge IDs found in the build.';
}

# Generic SOAP::Lite error handler.
sub handle_error {

    my $soap  = shift;
    my $res   = shift;

    print ref $res ? $res->faultstring : $soap->transport->status, "\n";
}

1;
