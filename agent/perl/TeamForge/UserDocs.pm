

package TeamForge::UserDocs;

sub new {
    my $class = shift;
    my $VAR1 = {
          'TeamForge::DiscussionApp' => {
                                          'deletePost' => {
                                                            'since' => '4.1',
                                                            'returns' => '',
                                                            'content' => 'Deletes the specified post.
'
                                                          },
                                          'getPostList' => {
                                                             'since' => '4.1',
                                                             'returns' => 'List of posts on this topic.',
                                                             'content' => 'Returns a list of posts associated with a specified topic.
'
                                                           },
                                          'deleteTopic' => {
                                                             'since' => '4.1',
                                                             'returns' => '',
                                                             'content' => 'Deletes the specified topic.
'
                                                           },
                                          'createTopic' => {
                                                             'since' => '4.1',
                                                             'returns' => 'the TopicSoapData Object',
                                                             'content' => 'Creates a discussion topic within a specified forum.
'
                                                           },
                                          'getForumList' => {
                                                              'since' => '4.1',
                                                              'returns' => 'The list of forums within the specified project',
                                                              'content' => 'Provides SOAP services for managing forums, topics and posts.

   Change HistoryVersion 4.4: No changes. Returns a list of forums within
   a specified project.
'
                                                            },
                                          'findPosts' => {
                                                           'since' => '4.1',
                                                           'returns' => 'List of posts matching search criteria.',
                                                           'content' => 'Finds a list of posts matching a search string.
'
                                                         },
                                          'createPost' => {
                                                            'since' => '4.1',
                                                            'returns' => 'Newly created post object data.',
                                                            'content' => 'Posts a new message to the discussion topic.
'
                                                          },
                                          'getTopicList' => {
                                                              'since' => '4.1',
                                                              'returns' => 'The TopicSummarySoapList of all topics in the forum',
                                                              'content' => 'Gets a list of all topics in a forum.
'
                                                            }
                                        },
          'TeamForge::IntegrationDataApp' => {
                                               'getDataByKey' => {
                                                                   'since' => '4.3',
                                                                   'returns' => 'The value of the stored piece of data',
                                                                   'content' => 'Get data for an object from the integration data service
'
                                                                 },
                                               'removeDataByKey' => {
                                                                      'since' => '4.3-HOTFIX1',
                                                                      'returns' => '',
                                                                      'content' => 'Remove a single integration data value from the specified object.
'
                                                                    },
                                               'getNamespaceId' => {
                                                                     'since' => '4.1',
                                                                     'returns' => 'Integration data namespace id',
                                                                     'content' => 'Get the key to an existing namespace.
'
                                                                   },
                                               'removeData' => {
                                                                 'since' => '4.3-HOTFIX1',
                                                                 'returns' => '',
                                                                 'content' => 'Remove a set of integration data values from the specified object.
'
                                                               },
                                               'registerNamespace' => {
                                                                        'since' => '4.1',
                                                                        'returns' => 'Integration data namespace id',
                                                                        'content' => 'Register a new namespace
'
                                                                      },
                                               'putData' => {
                                                              'since' => '4.3-HOTFIX1',
                                                              'returns' => '',
                                                              'content' => 'Add or replace a set of integration data values for the specified object.
'
                                                            },
                                               'putDataByKey' => {
                                                                   'since' => '4.3-HOTFIX1',
                                                                   'returns' => '',
                                                                   'content' => 'Add or replace a single integration data value for the specified object.
'
                                                                 },
                                               'getData' => {
                                                              'since' => '4.1',
                                                              'returns' => 'A SoapNamedValues collection of key/value pair stored data',
                                                              'content' => 'Get data for an object from the integration data service
'
                                                            },
                                               'setData' => {
                                                              'since' => '4.1',
                                                              'returns' => '',
                                                              'content' => 'Store data in the integration data service
'
                                                            },
                                               'setDataByKey' => {
                                                                   'since' => '4.3',
                                                                   'returns' => '',
                                                                   'content' => 'Store data in the integration data service
'
                                                                 }
                                             },
          'TeamForge::FileStorageApp' => {
                                           'uploadFile' => {
                                                             'since' => '4.1',
                                                             'returns' => 'File object id.',
                                                             'content' => 'Provides SOAP web service for uploading/downloading files. Uploaded files
   are assigned a "tempoary session-specific key" which must be used
   within the SOAP session to create a document/FRS file/etc. Otherwise,
   the uploaded file is simply discarded. This service provides support
   for uploading/downloading files as attachments. Clients which are
   unable to use SOAP file attachments for uploading files, can use
   "SimpleFileStorageApp" service for uploading files in memory.

   Change HistoryVersion 4.4: No changes. Uploads a file as SOAP
   attachment. The returned file id can be used to associate the file
   with a document, frs file, etc. Note that a file can ONLY be
   associated with a single document or an frs file.
'
                                                           },
                                           'downloadFile' => {
                                                               'since' => '4.1',
                                                               'returns' => 'File as SOAP attachment.',
                                                               'content' => 'Downloads file as SOAP attachment.
'
                                                             },
                                           'downloadFileDirect' => {
                                                                     'since' => '4.4SP1',
                                                                     'returns' => 'File as SOAP attachment.',
                                                                     'content' => 'Downloads file Direct as SOAP attachment. This doesnt assume that the
   file to be downloaded is stored in the session. This can only be used
   for Wiki or Tracker (Because those are the two for which we check
   permissions)
'
                                                                   }
                                         },
          'TeamForge::RbacApp' => {
                                    'getRoleGroupList' => {
                                                            'since' => '4.4-SP1',
                                                            'returns' => 'List of groups associated with a role.',
                                                            'content' => 'Returns a list of groups that belong to the specified role.
'
                                                          },
                                    'getGroupRoleList' => {
                                                            'since' => '4.4-SP1',
                                                            'returns' => 'List of roles the group is associated with.',
                                                            'content' => 'Returns a list of roles the group is associated with in a project.
'
                                                          },
                                    'getRoleList' => {
                                                       'since' => '4.3',
                                                       'returns' => 'The RoleSoapList describing all roles in the project',
                                                       'content' => 'Get a list of Roles in a project context. This call requires project
   admin permissions.
'
                                                     },
                                    'addGroup' => {
                                                    'since' => '4.4-SP1',
                                                    'returns' => '',
                                                    'content' => 'Add a group to a role, within the project scope.
'
                                                  },
                                    'addUser' => {
                                                   'since' => '4.1-HOTFIX4',
                                                   'returns' => '',
                                                   'content' => 'Add a user to the role, giving them all of the permissions of that role
'
                                                 },
                                    'removeUser' => {
                                                      'since' => '4.3-HOTFIX1',
                                                      'returns' => '',
                                                      'content' => 'Remove a user from a role
'
                                                    },
                                    'getRoleGroupUsers2' => {
                                                              'since' => '5.4',
                                                              'returns' => 'List of users in the specified role.',
                                                              'content' => 'Return a list of users who are part of a group and associated with the
   specified role.
'
                                                            },
                                    'removeCluster' => {
                                                         'since' => '4.4',
                                                         'returns' => '',
                                                         'content' => 'Remove an operation cluster to a role, removing the permission set.
'
                                                       },
                                    'getProjectsByIntegratedAppPermission' => {
                                                                                'since' => '5.4',
                                                                                'returns' => '',
                                                                                'content' => 'Returns the list of projects by integratedApp permission.
'
                                                                              },
                                    'createRole' => {
                                                      'since' => '4.1-HOTFIX4',
                                                      'returns' => 'The RoleSoapDO that was created',
                                                      'content' => 'Create a role in a given project
'
                                                    },
                                    'getRoleMemberList2' => {
                                                              'since' => '5.4',
                                                              'returns' => 'List of users in the specified role.',
                                                              'content' => 'Returns a list of users that are in a specified role.
'
                                                            },
                                    'addCluster' => {
                                                      'since' => '4.4',
                                                      'returns' => '',
                                                      'content' => 'Add an operation cluster to a role, expanding the permission set that the
   role grants access to.
'
                                                    },
                                    'setRolePaths' => {
                                                        'since' => '5.2',
                                                        'returns' => '',
                                                        'content' => 'Set the list of paths for a role.
'
                                                      },
                                    'listClusters' => {
                                                        'since' => '4.4',
                                                        'returns' => 'list of clusters for a role',
                                                        'content' => 'Get the list of operation cluster assigned to a role.
'
                                                      },
                                    'deleteRole' => {
                                                      'since' => '4.4',
                                                      'returns' => '',
                                                      'content' => 'Delete a role.
'
                                                    },
                                    'getIntegratedAppPermissionsForProject' => {
                                                                                 'since' => '5.4',
                                                                                 'returns' => '',
                                                                                 'content' => 'Returns integratedApp permissions associated with a project.
'
                                                                               },
                                    'getRoleGroupUsers' => {
                                                             'since' => '4.4-SP1',
                                                             'returns' => 'List of users in the specified role.',
                                                             'content' => 'Return a list of users who are part of a group and associated with the
   specified role.
'
                                                           },
                                    'getRoleMemberList' => {
                                                             'since' => '4.3-SP1',
                                                             'returns' => 'List of users in the specified role.',
                                                             'content' => 'Returns a list of users that are in a specified role.
'
                                                           },
                                    'getUserRoleList' => {
                                                           'since' => '4.3-SP1',
                                                           'returns' => 'List of roles that a user is a member of.',
                                                           'content' => 'Returns a list of roles that a user is a member of in the specified
   project. In order to view the list of roles another user belongs to,
   the caller must be a project admin.
'
                                                         },
                                    'listGroupRolesByProject' => {
                                                                   'since' => '4.4-SP1',
                                                                   'returns' => 'list of groups and the roles it is associated with',
                                                                   'content' => 'Returns a list of groups and the roles it is associated with in a
   project.
'
                                                                 },
                                    'listRolePaths' => {
                                                         'since' => '5.2',
                                                         'returns' => '',
                                                         'content' => 'Get the list of paths for a role.
'
                                                       },
                                    'removeGroup' => {
                                                       'since' => '4.4-SP1',
                                                       'returns' => '',
                                                       'content' => 'Removes the group for the role, within the project scope
'
                                                     }
                                  },
          'TeamForge::ScmListenerService' => {
                                               'getViewVCInformation' => {
                                                                           'since' => '',
                                                                           'returns' => 'a string array containing: project path, repository root path, adapter name, username',
                                                                           'content' => 'Get all the necessary information necessary for the CVSViewCGIServlet to
   run.
'
                                                                         },
                                               'getViewerInfoByRepository' => {
                                                                                'since' => '',
                                                                                'returns' => 'a string array containing: project path, repository root path, adapter name',
                                                                                'content' => 'Given a SCM server ID and repository dir on it, figure out to what
   project it belongs.
'
                                                                              },
                                               'getBrandingExternalSystemId' => {
                                                                                  'since' => '',
                                                                                  'returns' => 'The External System Id for Branding Repository',
                                                                                  'content' => 'Return the External System Id corresponding to the Branding repository.
   This is the repository with an adapter category=SCM_INTERNAL
'
                                                                                },
                                               'checkTriggerPermission' => {
                                                                             'since' => '',
                                                                             'returns' => '',
                                                                             'content' => 'Checks that a user has permission to make a commit to triggers.
'
                                                                           },
                                               'isValidUser' => {
                                                                  'since' => '',
                                                                  'returns' => 'int The code associated with the validation result',
                                                                  'content' => 'Returns whether or not the user and supplied password are legit.
'
                                                                },
                                               'isValidCommitMessage' => {
                                                                           'since' => '',
                                                                           'returns' => 'true if the commit message is valid for the repository.',
                                                                           'content' => 'Check to see if the commit message is valid for the repository.
'
                                                                         },
                                               'createCommit' => {
                                                                   'since' => '',
                                                                   'returns' => 'The commit ID of the commit object created (for multipart creates, as in CVS)',
                                                                   'content' => 'Create a commit object to correspond with a commit from an SCM
'
                                                                 },
                                               'getUsernameFromSession' => {
                                                                             'since' => '',
                                                                             'returns' => 'String The username for the session or an empty string if the session is invalid',
                                                                             'content' => 'Returns the username associated with the session or an empty string if
   the session is invalid.
'
                                                                           },
                                               'setAnalysisComplete' => {
                                                                          'since' => '',
                                                                          'returns' => '',
                                                                          'content' => 'Set a blackduck analysis to a completed state. This also sends out an
   email detailing the details of the analysis.
'
                                                                        },
                                               'clearBrandingOverrideCache' => {
                                                                                 'since' => '',
                                                                                 'returns' => '',
                                                                                 'content' => 'Clear the branding override cache. Called by data-checkout.py after
   updating working copy used by branding.
'
                                                                               },
                                               'getRolePaths' => {
                                                                   'since' => '',
                                                                   'returns' => 'a string array of role paths that describes the users access to a repository',
                                                                   'content' => '
'
                                                                 },
                                               'checkPermission' => {
                                                                      'since' => '',
                                                                      'returns' => 'if the user has access to a repository specified by the systemId and repositoryDirectory',
                                                                      'content' => 'Verify user credentials, and verify access to a repository. This should
   be used from external integration access checking.
'
                                                                    }
                                             },
          'TeamForge::PluggableApp' => {
                                         'getLinkPlugId' => {
                                                              'since' => '5.0',
                                                              'returns' => 'integrated application id for the specified project and base URL',
                                                              'content' => 'Get the integrated application id for the specified project and base URL.
'
                                                            },
                                         'setPluggableAppMessageResource' => {
                                                                               'since' => '',
                                                                               'returns' => '',
                                                                               'content' => 'Creates / Updates the Pluggable App Message resource
'
                                                                             },
                                         'editProjectConfigurationParameters' => {
                                                                                   'since' => '5.0',
                                                                                   'returns' => 'name/value pair of validation errors if any, where name is the',
                                                                                   'content' => 'Edit project specific configuration parameters of a pluggable
   application. Use getProjectConfigParameterData to get the existing
   configuration parameters for a pluggable application.
'
                                                                                 },
                                         'editIntegratedApplication' => {
                                                                          'since' => '',
                                                                          'returns' => '',
                                                                          'content' => 'Edits the Integrated Application for the giving PluggableComponentSoapDO
'
                                                                        },
                                         'getIntegratedAppPrefixes' => {
                                                                         'since' => '',
                                                                         'returns' => 'Array List of Integrated App Prefixes.',
                                                                         'content' => 'Gets the list of Integrated App Prefixes.
'
                                                                       },
                                         'getPlugIdByBaseUrl' => {
                                                                   'since' => '5.0',
                                                                   'returns' => 'integrated application id',
                                                                   'content' => 'Get integrated application id for the given base URL
'
                                                                 },
                                         'getProjectConfigParameterData' => {
                                                                              'since' => '5.0',
                                                                              'returns' => 'array of project specific configuration parameters',
                                                                              'content' => 'Get project specific configuration parameters for a pluggable
   application.
'
                                                                            },
                                         'removeProjectIntegratedApplication' => {
                                                                                   'since' => '5.0',
                                                                                   'returns' => '',
                                                                                   'content' => 'Remove integrated application from a project.
'
                                                                                 },
                                         'enablePluggableComponent' => {
                                                                         'since' => '5.0',
                                                                         'returns' => 'name/value pair of validation errors if any, where name is the',
                                                                         'content' => 'Add a pluggable application to a project
'
                                                                       },
                                         'listPluggableComponents' => {
                                                                        'since' => '5.0',
                                                                        'returns' => 'pcList PluggableComponentList.',
                                                                        'content' => 'List Pluggable Components. Gives the list of pluggable components
   available.
'
                                                                      },
                                         'createIntegratedApplication' => {
                                                                            'since' => '',
                                                                            'returns' => 'PluggableComponentSoapDO with the details of the integrated',
                                                                            'content' => 'Create/Import an integrated application.
'
                                                                          },
                                         'getProjectPrefix' => {
                                                                 'since' => '5.4',
                                                                 'returns' => 'project prefix for an integrated application.',
                                                                 'content' => 'Get the project prefix for an integrated application.
'
                                                               },
                                         'getBaseUrlByLinkId' => {
                                                                   'since' => '5.0',
                                                                   'returns' => 'the project integrated applications base URL',
                                                                   'content' => '
'
                                                                 },
                                         'getProjectPathByIntegratedAppId' => {
                                                                                'since' => '5.0',
                                                                                'returns' => 'project path for the given integrated application.',
                                                                                'content' => 'Get the project path for the given integrated application id.
'
                                                                              },
                                         'getLinkPlugIdByPlugId' => {
                                                                      'since' => '5.4',
                                                                      'returns' => 'integrated application link id for the specified project and',
                                                                      'content' => 'Get the integrated application id for the specified project and base URL.
'
                                                                    },
                                         'getIntegratedApplicationByName' => {
                                                                               'since' => '',
                                                                               'returns' => 'PluggableComponentSoapDO object',
                                                                               'content' => 'Returns the PluggableComponentSoapDO object for the given Integrated
   Application Name
'
                                                                             },
                                         'updateRecentAccess' => {
                                                                   'since' => '5.4',
                                                                   'returns' => '',
                                                                   'content' => 'Updates the recent access entries for the user.
'
                                                                 }
                                       },
          'TeamForge::CollabNet' => {
                                      'getCurrentUserData' => {
                                                                'since' => '5.4',
                                                                'returns' => 'a UserSoapDO for a given user session id.',
                                                                'content' => 'Get the user details for a given user session id.
'
                                                              },
                                      'setProjectAccessLevel' => {
                                                                   'since' => '4.1-HOTFIX6.1',
                                                                   'returns' => '',
                                                                   'content' => 'Sets the project access level
'
                                                                 },
                                      'getCommentList' => {
                                                            'since' => '4.2',
                                                            'returns' => 'List of comments.',
                                                            'content' => 'Gets list of comments for object.
'
                                                          },
                                      'listUsersWithGeneralPermission' => {
                                                                            'since' => '5.4',
                                                                            'returns' => 'List of Users who have permission on the given object for the',
                                                                            'content' => 'Return the list of users who have permission on a particular object for a
   given Operation String. The api does not support Default access
   permissions.
'
                                                                          },
                                      'deleteGroup' => {
                                                         'since' => '4.4 SP1',
                                                         'returns' => '',
                                                         'content' => 'Delete a group.
'
                                                       },
                                      'listAttachments' => {
                                                             'since' => '4.4-SP1',
                                                             'returns' => 'List of attachments, does not include the actual file.',
                                                             'content' => 'Lists the attachments associated with the object, the attachment itself
   is not part of the returned object.
'
                                                           },
                                      'getProjectByPath' => {
                                                              'since' => '5.4',
                                                              'returns' => 'a Project2SoapDO for a given project path.',
                                                              'content' => 'Get the project data for a given project path.
'
                                                            },
                                      'listAttachments2' => {
                                                              'since' => '5.3',
                                                              'returns' => 'List of attachments, does not include the actual file.',
                                                              'content' => 'Lists the attachments associated with the object, the attachment itself
   is not part of the returned object. The difference to listAttachments
   is that this method will return information about the transactionId
   and user who created the attachment as well.
'
                                                            },
                                      'login' => {
                                                   'since' => '4.1',
                                                   'returns' => 'User session key.',
                                                   'content' => 'Logs in a user and creates a new session.
'
                                                 },
                                      'deleteAssociation' => {
                                                               'since' => '4.2',
                                                               'returns' => '',
                                                               'content' => 'Deletes an association between two objects
'
                                                             },
                                      'keepAlive' => {
                                                       'since' => '4.1',
                                                       'returns' => '',
                                                       'content' => 'Keeps a session alive. this is a no-op that just validates the session
   and updates its last used time.
'
                                                     },
                                      'getJSessionId' => {
                                                           'since' => '5.4',
                                                           'returns' => 'User jsession Id.',
                                                           'content' => 'returns current user Jsession Id using one time token id
'
                                                         },
                                      'createProject' => {
                                                           'since' => '4.2-SP1',
                                                           'returns' => 'The  project data',
                                                           'content' => 'Creates a project.
'
                                                         },
                                      'removeProjectMember' => {
                                                                 'since' => '4.3 hotfix5',
                                                                 'returns' => '',
                                                                 'content' => 'Remove a user from a project.
'
                                                               },
                                      'addProjectMember' => {
                                                              'since' => '4.4',
                                                              'returns' => '',
                                                              'content' => 'Make a user a member of a project.
'
                                                            },
                                      'setUserData' => {
                                                         'since' => '4.3',
                                                         'returns' => '',
                                                         'content' => 'Sets the user information. NOTE: Only super-users are allowed to set user
   data.
'
                                                       },
                                      'getProjectData' => {
                                                            'since' => '4.1',
                                                            'returns' => 'Project data.',
                                                            'content' => 'Returns project data.
'
                                                          },
                                      'getProjectDiskUsage' => {
                                                                 'since' => ' 4.3',
                                                                 'returns' => 'the file storage disk usage of a project',
                                                                 'content' => 'Get the filestorage disk utilization of a project specified by a project
   id
'
                                                               },
                                      'getUserEffectiveMode' => {
                                                                  'since' => '5.4',
                                                                  'returns' => 'effective mode (ALM or SCM) for the current user',
                                                                  'content' => 'Get effective mode (ALM or SCM) for the current user
'
                                                                },
                                      'setGroupData' => {
                                                          'since' => '',
                                                          'returns' => '',
                                                          'content' => 'Sets the group information. NOTE: Only super-users are allowed to set
   group data.
'
                                                        },
                                      'invalidateResourceBundleCache' => {
                                                                           'since' => '5.0',
                                                                           'returns' => '',
                                                                           'content' => 'Invalidate a Message Resource Bundle.
'
                                                                         },
                                      'getJSessionBySoapId' => {
                                                                 'since' => '5.4',
                                                                 'returns' => 'String jsession id',
                                                                 'content' => 'gets the JsessionID using soap Id.
'
                                                               },
                                      'getVersion' => {
                                                        'since' => '4.1',
                                                        'returns' => 'Version as string.',
                                                        'content' => 'Get TeamForge version. NOTE: In earlier version of TeamForge, this call
   returned a symbolic name for the version. It is now replaced with the
   actual version of the product as seen in the "About TeamForge" dialog.
'
                                                      },
                                      'getProjectQuota' => {
                                                             'since' => '4.3',
                                                             'returns' => 'The disk quota for the project.',
                                                             'content' => 'Get the disk quota for a project.
'
                                                           },
                                      'loginAnonymous' => {
                                                            'since' => '4.4',
                                                            'returns' => 'User session key.',
                                                            'content' => 'This method allows to login as anonymous to get TF default access. To
   make sure this method does not really leave a security hole, a shared
   security is used. To use this method, the following property must be
   added into sourceforge_configuration.properties
   soap.anonymous.shared_secret=aSecret
'
                                                          },
                                      'getApiVersion' => {
                                                           'since' => '4.1-HOTFIX2',
                                                           'returns' => 'API version as string.',
                                                           'content' => 'Get TeamForge API version. This is different from the TeamForge Version
   and can be changed independent of that. IMPORTANT: note that the api
   version string returned CAN be updated between releases. Therefore it
   is very important to perform proper version checking against the
   version returned. This is because we may introduce new API calls as
   additional features are added to our product. However we guarantee
   that subsequent releases will not change existing API signatures or
   SOAP structures. The version returned will be a period separated
   string with the following format: - The first two fields represent the
   TeamForge release version number. For example, "4.3" equates to
   SourceForge 4.3 - The third field, if present, will represent service
   pack version. - The fourth field, if present, will represent the hot
   fix version. Example: 4.3 => SourceForge 4.3 4.3.0.2 => SourceForge
   4.3 Hotfix2 4.3.2 => SourceForge 4.3 SP2 So a call that existed in 4.3
   is guaranteed to exist in 4.3.2. One in 4.3.0.2 will also work in
   4.3.2.
'
                                                         },
                                      'getProjectAccessLevel' => {
                                                                   'since' => '4.1-HOTFIX6.1',
                                                                   'returns' => 'The project access level.',
                                                                   'content' => '
'
                                                                 },
                                      'getUserProjectList' => {
                                                                'since' => '4.1-SP3',
                                                                'returns' => 'List of user projects.',
                                                                'content' => 'Returns a list of projects this user is a member of.
'
                                                              },
                                      'loginWithToken' => {
                                                            'since' => '4.2',
                                                            'returns' => 'User session key.',
                                                            'content' => 'Logs in a user and creates a new session.
'
                                                          },
                                      'getVersionInformationList' => {
                                                                       'since' => '4.2',
                                                                       'returns' => 'The version information',
                                                                       'content' => 'Obtains a list of versions and last modified dates for the objects
   residing in the specified folder.
'
                                                                     },
                                      'createGroup' => {
                                                         'since' => '4.4 SP1',
                                                         'returns' => 'Newly created group object.',
                                                         'content' => 'Creates a new group with the specified parameters. NOTE: Only super-users
   are allowed to create groups through SOAP interface.
'
                                                       },
                                      'getWebAndSoapSessionId' => {
                                                                    'since' => '5.4',
                                                                    'returns' => 'a string containing the web and soap session ids separated by &',
                                                                    'content' => '
'
                                                                  },
                                      'invalidateEmailTemplate' => {
                                                                     'since' => '5.0',
                                                                     'returns' => '',
                                                                     'content' => 'Invalidate a Mail template.
'
                                                                   },
                                      'getAuditHistoryList2' => {
                                                                  'since' => '5.3',
                                                                  'returns' => 'List of changes made to the specified object.',
                                                                  'content' => 'Returns the list of changes made to the specified object in reverse
   chronological order. The entries returned include all updates to an
   object but does not include the object creation itself. The difference
   to getAuditHistoryList is that this method will also return changes on
   fields introduced in TeamForge 5.3. NOTE: The object must be either a
   task or an artifact. All other object types result in a
   IllegalArgumentFault.
'
                                                                },
                                      'getActiveGroupMembers2' => {
                                                                    'since' => '5.4',
                                                                    'returns' => 'List of members of a group',
                                                                    'content' => 'Get all the members of a group
'
                                                                  },
                                      'setProjectQuota' => {
                                                             'since' => '4.3',
                                                             'returns' => '',
                                                             'content' => 'Get the disk quota for a project.
'
                                                           },
                                      'findUsers2' => {
                                                        'since' => '5.4',
                                                        'returns' => 'List of users matching search criteria.',
                                                        'content' => 'Finds a list of users matching a search string.
'
                                                      },
                                      'getAuditHistoryList' => {
                                                                 'since' => '4.1-SP3',
                                                                 'returns' => 'List of changes made to the specified object.',
                                                                 'content' => 'Returns the list of changes made to the specified object in reverse
   chronological order. The entries returned include all updates to an
   object but does not include the object creation itself. NOTE: The
   object must be either a task or an artifact. All other object types
   result in a IllegalArgumentFault.
'
                                                               },
                                      'getProjectMemberList' => {
                                                                  'since' => '4.1',
                                                                  'returns' => 'Members of project.',
                                                                  'content' => 'Returns project membership list.
'
                                                                },
                                      'addGroupMember' => {
                                                            'since' => '4.4 SP1',
                                                            'returns' => '',
                                                            'content' => 'Adds a user to a group. The user and group must be existing already.
'
                                                          },
                                      'logoff' => {
                                                    'since' => '4.1',
                                                    'returns' => '',
                                                    'content' => '
'
                                                  },
                                      'getUserList2' => {
                                                          'since' => '5.4',
                                                          'returns' => 'List of users matching a filter.',
                                                          'content' => 'Get a list of all users on the system.
'
                                                        },
                                      'getGroupList2' => {
                                                           'since' => '5.1',
                                                           'returns' => 'List of groups matching a filter.',
                                                           'content' => 'Same as getGroupList but the returned list of groups also includes the
   group identifier.
'
                                                         },
                                      'getUserGroupList' => {
                                                              'since' => '4.4 SP1',
                                                              'returns' => 'List of groups matching a filter.',
                                                              'content' => 'Get a list of all groups the user belongs. In order to view the list of
   groups another user belongs to, the caller must be a site admin.
'
                                                            },
                                      'findUsers' => {
                                                       'since' => '4.1',
                                                       'returns' => 'List of users matching search criteria.',
                                                       'content' => 'Finds a list of users matching a search string.
'
                                                     },
                                      'listProjectAdmins2' => {
                                                                'since' => '5.4',
                                                                'returns' => 'Administrators of the project.',
                                                                'content' => 'Returns project administrators list.
'
                                                              },
                                      'getUserData' => {
                                                         'since' => '4.2',
                                                         'returns' => 'User data.',
                                                         'content' => 'Returns the user information.
'
                                                       },
                                      'findProjects' => {
                                                          'since' => '4.1',
                                                          'returns' => 'List of projects matching search criteria.',
                                                          'content' => 'Finds a list of projects matching a search string.
'
                                                        },
                                      'createUser2' => {
                                                         'since' => '5.4',
                                                         'returns' => 'Newly created user object.',
                                                         'content' => 'Creates a new user with the specified parameters. NOTE: Only super-users
   are allowed to create users through SOAP interface.
'
                                                       },
                                      'createProjectFromTemplate' => {
                                                                       'since' => '4.2-SP1',
                                                                       'returns' => 'The  project data',
                                                                       'content' => 'Create a project from template.
'
                                                                     },
                                      'hasPermission' => {
                                                           'since' => '4.1-HOTFIX2',
                                                           'returns' => 'whether the current user has permission for an operation on a specified object',
                                                           'content' => 'Check whether the current user has permission for an operation on a
   specified object
'
                                                         },
                                      'getGroupList' => {
                                                          'since' => '4.4 SP1',
                                                          'returns' => 'List of groups matching a filter.',
                                                          'content' => 'Get a list of all groups on the system. At this time, the filter
   parameters are ignored. In a future release, the lists will allow the
   results to be filtered.
'
                                                        },
                                      'getSessionId' => {
                                                          'since' => '5.4',
                                                          'returns' => 'User session key.',
                                                          'content' => 'returns current user session Id using one time token id
'
                                                        },
                                      'isHostedMode' => {
                                                          'since' => '4.3',
                                                          'returns' => 'true if the appserver is running in Hosted Mode.',
                                                          'content' => 'Verify if the TeamForge appserver is running in Hosted Mode.
'
                                                        },
                                      'getGroupData' => {
                                                          'since' => '4.4 SP1',
                                                          'returns' => 'Group data.',
                                                          'content' => 'Returns the group information.
'
                                                        },
                                      'getUserData2' => {
                                                          'since' => '5.4',
                                                          'returns' => 'User data.',
                                                          'content' => 'Returns the user information.
'
                                                        },
                                      'getProjectGroupList' => {
                                                                 'since' => '4.4-SP1',
                                                                 'returns' => 'Groups who have a role in the project.',
                                                                 'content' => 'Returns a list of groups that have a role in the project.
'
                                                               },
                                      'removeGroupMember' => {
                                                               'since' => '4.4 SP1',
                                                               'returns' => '',
                                                               'content' => 'Remove a user from a group.
'
                                                             },
                                      'getAssociationList' => {
                                                                'since' => '4.2',
                                                                'returns' => 'A list of associations for the given object.',
                                                                'content' => 'List all of the associations for a given object.
'
                                                              },
                                      'reindexObject' => {
                                                           'since' => '4.1-SP3-HOTFIX9',
                                                           'returns' => '',
                                                           'content' => 'Re-indexes the contents of the specified project, folder, item or user.
   CAUTION: Use this operation sparingly. Indiscriminate use can cause
   system overload.
'
                                                         },
                                      'hasGeneralPermission' => {
                                                                  'since' => '5.4',
                                                                  'returns' => 'Does the user has permission on this resource for this project',
                                                                  'content' => 'Check if the user has general permission for the resource (specified by
   objectid).
'
                                                                },
                                      'createUser' => {
                                                        'since' => '4.1',
                                                        'returns' => 'Newly created user object.',
                                                        'content' => 'Creates a new user with the specified parameters. NOTE: Only super-users
   are allowed to create users through SOAP interface.
'
                                                      },
                                      'createOrReplaceProjectTemplate' => {
                                                                            'since' => '5.3',
                                                                            'returns' => 'The template project data',
                                                                            'content' => 'Creates or replaces a template from an existing project
'
                                                                          },
                                      'getProjectList' => {
                                                            'since' => '4.1',
                                                            'returns' => 'List of projects',
                                                            'content' => 'Returns a list of all projects visible to the user. IMPORTANT: In 4.1,
   this call returned ONLY projects of which the user is a member of. Use
   getUserProjectList() for getting a list of projects in which the user
   is a member.
'
                                                          },
                                      'getActiveGroupMembers' => {
                                                                   'since' => '4.4 SP1',
                                                                   'returns' => 'List of groups matching a filter.',
                                                                   'content' => 'Get all the members of a group
'
                                                                 },
                                      'listTemplates' => {
                                                           'since' => '4.2-SP1',
                                                           'returns' => 'The list of template projects',
                                                           'content' => 'List project templates within the installation.
'
                                                         },
                                      'getUserList' => {
                                                         'since' => '4.3',
                                                         'returns' => 'List of users matching a filter.',
                                                         'content' => 'Get a list of all users on the system. At this time, the filter
   parameters are ignored. In a future release, the lists will allow the
   results to be filtered.
'
                                                       },
                                      'deleteAttachment' => {
                                                              'since' => '4.4-SP1',
                                                              'returns' => '',
                                                              'content' => 'Deletes the specified attachment of the specified object.
'
                                                            },
                                      'getConfigurationValue' => {
                                                                   'since' => '4.4-SP1',
                                                                   'returns' => 'The configuration value of the key requested.',
                                                                   'content' => 'Get Configuration value for the passed key.
'
                                                                 },
                                      'getProjectsForUser' => {
                                                                'since' => '4.4-SP1',
                                                                'returns' => 'List of projects.',
                                                                'content' => 'Return a list of projects in which the user is either a project member or
   a group member associated with a role in a project.
'
                                                              },
                                      'setUserData2' => {
                                                          'since' => '5.4',
                                                          'returns' => '',
                                                          'content' => 'Sets the user information. NOTE: Only super-users are allowed to set user
   data.
'
                                                        },
                                      'getProjectListForUser' => {
                                                                   'since' => '4.4-SP1',
                                                                   'returns' => 'List of user projects.',
                                                                   'content' => 'Returns a list of projects the user passed as parameter is a member of
   (the list contains only the projects that the soap caller has the
   right to see)
'
                                                                 },
                                      'listProjectAdmins' => {
                                                               'since' => '5.0',
                                                               'returns' => 'Administrators of the project.',
                                                               'content' => 'Returns project administrators list.
'
                                                             },
                                      'deleteProject' => {
                                                           'since' => '4.3',
                                                           'returns' => '',
                                                           'content' => 'Delete a project.
'
                                                         },
                                      'createAssociation' => {
                                                               'since' => '4.1',
                                                               'returns' => '',
                                                               'content' => 'Creates an association between two objects. User must have view
   permission on both object and edit permission on at least one of the
   two objects.
'
                                                             }
                                    },
          'TeamForge::ScmApp' => {
                                   'createRepository' => {
                                                           'since' => '',
                                                           'returns' => 'Repository Data',
                                                           'content' => 'Creates a new repository in the given SCM server.

   Rendered obsolete in 5.2; createRepositoryData2() supports the new
   hideMonitoringDetails flag.
'
                                                         },
                                   'createRepository2' => {
                                                            'since' => '5.2',
                                                            'returns' => 'Repository Data',
                                                            'content' => 'Creates a new repository in the given SCM server
'
                                                          },
                                   'getScmAdapterNames' => {
                                                             'since' => '5.4',
                                                             'returns' => 'String[] The known SCM adapter names',
                                                             'content' => 'Returns a string array containing the known list of supported SCM
   adapters on the server.
'
                                                           },
                                   'getRepositoryData' => {
                                                            'since' => '4.2SP1',
                                                            'returns' => 'Repository Data',
                                                            'content' => 'Returns data associated with a specific repository

   Note that a user has permission to view the repository data if the
   user belongs to a role that has either full view permission or any
   path-based permission on this repository.

   This method is rendered obselete in 5.2; getRepositoryData2() returns
   an additional new flag.
'
                                                          },
                                   'getSCMCheckoutCommand' => {
                                                                'since' => '5.3',
                                                                'returns' => 'command to check out the repository',
                                                                'content' => 'Returns the command needed to check out a specific repository. Note that
   a user has permission to view the checkout command if the user belongs
   to a role that has either full view permission or any path-based
   permission on this repository.
'
                                                              },
                                   'getScmAdapterParameterNamesWithType' => {
                                                                              'since' => '5.4',
                                                                              'returns' => 'SoapNamedValues The named values with type for the SCM adapter',
                                                                              'content' => 'Returns the SCM adapter parameter names with their corresponding type.
'
                                                                            },
                                   'getRepositoryList' => {
                                                            'since' => '4.1',
                                                            'returns' => 'List of SCM repositories within the specified project.',
                                                            'content' => 'Provides SOAP services for managing the SCM system.

   Change HistoryVersion 5.4

     * Added new method moveRepository.

     * Added new method getScmAdapterNames.

     * Added new method getScmAdapterParameterNamesWithType.

     * Added new method addExternalSystem.

   Version 5.3

     * Added new method getSCMCheckoutCommand.

     * All methods taking SoapFilter arguments now support ORing filter
       conditions if multiple SoapFilter objects with the same name but
       different values are passed.

   Version 5.2

     * getRepositoryList: Modified in 5.2 to observe path based
       permission.

     * getCommitList: Modified in 5.2 to observe path based permission.

     * getCommitData: Modified in 5.2 to observe path based permission.

     * getRepositoryData:Rendered obsolete in 5.2; getRepositoryData2()
       returns additional fields. Modified in 5.2 to observe path based
       permission.

     * createRepository:Rendered obsolete in 5.2; createRepository2()
       supports additional field.

     * getRepositoryData2: New operation added in 5.2, to support new
       repository field.

     * createRepository2: New operation added in 5.2, to support new
       repository field.

   Lists the repositories within a given project that the current user
   has been granted view permission through roles and path based
   permission. Note that if a user belongs to a role that has set up path
   based permission on a repository, that repository will appear in this
   list.
'
                                                          },
                                   'getRepositoryData2' => {
                                                             'since' => '5.2',
                                                             'returns' => 'Repository Data',
                                                             'content' => 'Returns data associated with a specific repository Note that a user has
   permission to view the repository data if the user belongs to a role
   that has either full view permission or any path-based permission on
   this repository.
'
                                                           },
                                   'getCommitData' => {
                                                        'since' => '4.1',
                                                        'returns' => 'Commit data.',
                                                        'content' => 'Returns data associated with a specific commit. Only files that are
   visible through roles or path based permission are included in the
   commit data.
'
                                                      },
                                   'moveRepository' => {
                                                         'since' => '5.4',
                                                         'returns' => 'RepositorySoapDO The repository object post-move',
                                                         'content' => 'Moves the repository from its current project to the one specified.
'
                                                       },
                                   'getCommitList' => {
                                                        'since' => '4.1',
                                                        'returns' => 'List of SCM commits on the specified repository.',
                                                        'content' => 'Lists the commits on a given repository. Note that if a user belongs to a
   role that has set up path based permission on a repository, that user
   can view all the commits for the repository, even for commits to paths
   for which the user does not have view permission (though file details
   will be filtered appropriately when getCommitDetails() is called).
   Change HistoryVersion 4.3

     * Added additional parameter filters. The valid filter names are:
       createdAfter, createdBefore, createdBy.

     * The list is always paired down to include no more than 5000
       results.
'
                                                      },
                                   'addExternalSystem' => {
                                                            'since' => '5.4',
                                                            'returns' => 'The GUID of the newly added external system.',
                                                            'content' => 'Adds an external system of the given adapter type with its title,
   description and respective list of parameters.

     * Pre-condition: the adapter type and adapter type parameters must
       be the ones expected as documented.
'
                                                          }
                                 },
          'TeamForge::TaskApp' => {
                                    'findTasks' => {
                                                     'since' => '4.1',
                                                     'returns' => 'List of tasks matching search criteria.',
                                                     'content' => 'Finds a list of tasks matching a search string.
'
                                                   },
                                    'createTaskGroup' => {
                                                           'since' => '4.1',
                                                           'returns' => 'Newly created task group object.',
                                                           'content' => 'Creates a new task group.
'
                                                         },
                                    'getTaskGroupList' => {
                                                            'since' => '4.1',
                                                            'returns' => 'List of task groups within the project.',
                                                            'content' => 'Provides SOAP services for managing user tasks. Change HistoryVersion 5.3

     * All methods taking SoapFilter

     arguments now support ORing filter conditions if multiple SoapFilter
     objects with the same name but different values are passed.

   Version 5.2

     * createTask: Times are no longer stripped off from startDate and
       endDate before storing internally. In other words, we no longer
       convert these times to midnight.

     * setTaskData: Times are no longer stripped off from startDate and
       endDate before storing internally. In other words, we no longer
       convert these times to midnight.

   Returns a list of task groups for a project (in the correct order).
'
                                                          },
                                    'getTaskData' => {
                                                       'since' => '4.1',
                                                       'returns' => 'the task data associated with the task at the given path',
                                                       'content' => 'Returns data associated with the specified task.
'
                                                     },
                                    'createTaskDependency' => {
                                                                'since' => '4.1',
                                                                'returns' => '',
                                                                'content' => 'Create a task dependency.
'
                                                              },
                                    'deleteTaskGroup' => {
                                                           'since' => '4.1',
                                                           'returns' => '',
                                                           'content' => 'Deletes a task group.
'
                                                         },
                                    'getPredecessorTaskList' => {
                                                                  'since' => '4.2',
                                                                  'returns' => 'List of predecessor tasks',
                                                                  'content' => 'Return a list of tasks on which the task is dependent ("predecessors").
   NOTE: Replaces listPredecessorTasks() in 4.1.
'
                                                                },
                                    'moveTaskGroup' => {
                                                         'since' => '4.1',
                                                         'returns' => 'the task group data for the updated group.',
                                                         'content' => 'Moves a task group.
'
                                                       },
                                    'getSuccessorTaskList' => {
                                                                'since' => '4.2',
                                                                'returns' => 'List of successor tasks',
                                                                'content' => 'Return a list of tasks which are dependent on the task ("successors").
   NOTE: Replaces listSuccessorTasks() in 4.1.
'
                                                              },
                                    'deleteTaskDependency' => {
                                                                'since' => '4.1',
                                                                'returns' => '',
                                                                'content' => 'Delete a task dependency.
'
                                                              },
                                    'moveTask' => {
                                                    'since' => '4.1',
                                                    'returns' => 'the task group data for the updated group.',
                                                    'content' => 'Moves a task.
'
                                                  },
                                    'createTask' => {
                                                      'since' => '4.1',
                                                      'returns' => 'Task object.',
                                                      'content' => 'Creates a new task with the specified information. Version 4.2

     * New parameter (includeWeekends) added.
'
                                                    },
                                    'hasTasksWithPendingChanges' => {
                                                                      'since' => '4.1',
                                                                      'returns' => 'true if a folder has any items with pending changes under it, false otherwise',
                                                                      'content' => 'Return true if a folder has any items with pending changes under it.
'
                                                                    },
                                    'setTaskData' => {
                                                       'since' => '4.1',
                                                       'returns' => '',
                                                       'content' => 'Returns data associated with the specified task. Version 4.2

     * TaskSoapDO has a new member field (includeWeekends).
'
                                                     },
                                    'getTaskList' => {
                                                       'since' => '"4.1"',
                                                       'returns' => 'Filtered list of tasks within the project or task group.',
                                                       'content' => 'Returns a filtered list of tasks within a given project or task group.
   Change HistoryVersion 4.2

     * Added additional parameter (filters) for filtering task lists.
'
                                                     },
                                    'renameTaskGroup' => {
                                                           'since' => '4.1',
                                                           'returns' => 'the task group data for the updated group.',
                                                           'content' => 'Renames a task group.
'
                                                         },
                                    'getTaskGroupData' => {
                                                            'since' => '4.1',
                                                            'returns' => 'the task group data associated with the task at the given path',
                                                            'content' => 'Returns data associated with the specified task group.
'
                                                          },
                                    'reorderTaskGroups' => {
                                                             'since' => '4.1',
                                                             'returns' => '',
                                                             'content' => 'Set a new order for the task groups (folders) in a parent folder. The
   task groups will be listed in this new order in UI.
'
                                                           },
                                    'deleteTask' => {
                                                      'since' => '4.1',
                                                      'returns' => '',
                                                      'content' => 'Deletes a task.
'
                                                    }
                                  },
          'TeamForge::DocumentApp' => {
                                        'createReview' => {
                                                            'since' => '',
                                                            'returns' => 'The data object of the review',
                                                            'content' => 'Create a document review cycle
'
                                                          },
                                        'createDocumentFolder' => {
                                                                    'since' => '4.2',
                                                                    'returns' => 'Document Folder data object.',
                                                                    'content' => 'Creates a new document folder with the specified title, description, etc.
'
                                                                  },
                                        'getDocumentFolderData' => {
                                                                     'since' => '4.2',
                                                                     'returns' => 'Document Folder data object.',
                                                                     'content' => 'Gets detailed data on a document folder
'
                                                                   },
                                        'setDocumentFolderData' => {
                                                                     'since' => '4.2',
                                                                     'returns' => '',
                                                                     'content' => 'Sets detailed data on a document folder
'
                                                                   },
                                        'moveDocument' => {
                                                            'since' => '4.2',
                                                            'returns' => 'New document object.',
                                                            'content' => 'Moves a document to a specified target folder.
'
                                                          },
                                        'findDocuments' => {
                                                             'since' => '4.1',
                                                             'returns' => 'List of documents matching search criteria.',
                                                             'content' => 'Finds a list of documents matching a search string.
'
                                                           },
                                        'getDocumentFolderList' => {
                                                                     'since' => '4.1',
                                                                     'returns' => 'Document folder list.',
                                                                     'content' => 'Provides SOAP web service for document manager application.

   Change HistoryVersion 4.4

     * setDocumentDataWithUrl: Removed in 4.4. Use
       DocumentSoapDO.setFileUrl and setDocumentData instead.

     * getDocumentFileUrl: Removed in 4.4. Use getDocumentData and call
       DocumentSoapDO.getFileUrl instead.

   List document folders.
'
                                                                   },
                                        'setDocumentDataWithAssociation' => {
                                                                              'since' => '4.4-SP1',
                                                                              'returns' => '',
                                                                              'content' => 'Sets specified document data with Association.
'
                                                                            },
                                        'setDocumentData' => {
                                                               'since' => '',
                                                               'returns' => '',
                                                               'content' => 'Sets specified document data.
'
                                                             },
                                        'createDocumentWithUrl' => {
                                                                     'since' => '4.4SP1',
                                                                     'returns' => 'Document data object.',
                                                                     'content' => 'Creates a new document with the specified tile, description, etc. for a
   URL with an association. If the site is configured to have an
   association mandatory on document create, then associationId must be
   specified.
'
                                                                   },
                                        'getAssignedDocumentReviewList' => {
                                                                             'since' => '4.2',
                                                                             'returns' => 'Document review list.',
                                                                             'content' => 'Lists all document reviews assigned to a user for review.
'
                                                                           },
                                        'deleteDocumentFolder' => {
                                                                    'since' => '4.2',
                                                                    'returns' => '',
                                                                    'content' => 'Deletes a document folder with the specified id.
'
                                                                  },
                                        'createDocument' => {
                                                              'since' => '4.4-SP1',
                                                              'returns' => 'Document data object.',
                                                              'content' => 'Creates a new document with the specified tile, description, etc. If the
   site is configured to have an association mandatory on document
   create, then associationId must be specified.
'
                                                            },
                                        'getDocumentData' => {
                                                               'since' => '4.1',
                                                               'returns' => 'Document data object.',
                                                               'content' => 'Get specified document data. Change HistoryVersion 4.4

     * DocumentSoapDO.getMimeType() will return null for a document that
       uses external url, while DocumentSoapDO.getFileUrl() will allow
       direct access of file url without making a separate call.
'
                                                             },
                                        'getDocumentFileId' => {
                                                                 'since' => '4.1',
                                                                 'returns' => 'File storage id (for download using FileStorageService or SimpleFileStorageService).',
                                                                 'content' => 'Returns a the file id associated with the document file. The returned
   file id should be used with one of the file storage services to
   download the file (e.g. FileStorageApp or SimpleFileStorageApp
   service).
   IMPORTANT: The returned file id is valid ONLY during the session.
'
                                                               },
                                        'getDocumentReviewList' => {
                                                                     'since' => '4.2',
                                                                     'returns' => 'Document review list.',
                                                                     'content' => 'Lists all document reviews within a project or a document. The following
   are the only permitted combinations:

     * containerId=null, filters=(createdBy="username" AND
       status="open"}: Returns all open reviews created by the user.

     * containerId=documentId, filters=null: Returns a list of reviews
       (open and closed) for the document.
'
                                                                   },
                                        'moveDocumentFolder' => {
                                                                  'since' => '4.2',
                                                                  'returns' => 'new document folder',
                                                                  'content' => 'Moves document folder
'
                                                                },
                                        'getDocumentList' => {
                                                               'since' => '4.1',
                                                               'returns' => 'Document list.',
                                                               'content' => 'Lists all documents within a document folder. Change HistoryVersion 4.2

     * Added additional parameter filters for future use. Must be null or
       empty for now.
'
                                                             },
                                        'deleteDocument' => {
                                                              'since' => '4.1',
                                                              'returns' => '',
                                                              'content' => 'Deletes a document.
'
                                                            }
                                      },
          'TeamForge::CategorizationApp' => {
                                              'getAllCategories' => {
                                                                      'since' => '"4.3-SP1"',
                                                                      'returns' => 'List of categories within the project.',
                                                                      'content' => 'Returns a list of all categories.
'
                                                                    },
                                              'getCategoryProjects' => {
                                                                         'since' => '"4.3-SP1"',
                                                                         'returns' => 'List of projects that are in the category',
                                                                         'content' => 'Get list of projects in the specified category and, if requested,
   subcategories
'
                                                                       },
                                              'isCategorizationEnabled' => {
                                                                             'since' => '4.3-SP1',
                                                                             'returns' => 'true/false',
                                                                             'content' => 'Provides SOAP services for managing project categories.
   Change HistoryVersion 4.4: No changes. Check if categorization support
   is enabled site-wide.
'
                                                                           },
                                              'deleteCategory' => {
                                                                    'since' => '"4.3-SP1"',
                                                                    'returns' => '',
                                                                    'content' => 'Deletes an category.
'
                                                                  },
                                              'createCategory' => {
                                                                    'since' => '',
                                                                    'returns' => 'A category data object representing the newly created category',
                                                                    'content' => 'Create a category
'
                                                                  },
                                              'moveCategory' => {
                                                                  'since' => '"4.3-SP1"',
                                                                  'returns' => '',
                                                                  'content' => 'Move a Category including all subcategories under different parent. Fails
   completely if not everything can be moved.
'
                                                                },
                                              'getProjectCategories' => {
                                                                          'since' => '"4.3-SP1"',
                                                                          'returns' => 'List of categories the project is in',
                                                                          'content' => 'Returns a list of categories the project belongs to
'
                                                                        },
                                              'setCategoryData' => {
                                                                     'since' => '"4.3-SP1"',
                                                                     'returns' => '',
                                                                     'content' => 'Sets data on a specific category
'
                                                                   },
                                              'getSubcategories' => {
                                                                      'since' => '"4.3-SP1"',
                                                                      'returns' => 'List of categories in the root category.',
                                                                      'content' => 'Returns a list of subcategories to the specified category.
'
                                                                    },
                                              'getUncategorizedProjects' => {
                                                                              'since' => '"4.3-SP1"',
                                                                              'returns' => 'List of projects that are in the category',
                                                                              'content' => 'Get list of projects that have not been categorized
'
                                                                            },
                                              'removeProjectFromCategory' => {
                                                                               'since' => '"4.3-SP1"',
                                                                               'returns' => '',
                                                                               'content' => 'Remove a given project from a category.
'
                                                                             },
                                              'getCategoryData' => {
                                                                     'since' => '"4.3-SP1"',
                                                                     'returns' => 'Detailed data on the category.',
                                                                     'content' => 'Returns a data object for a given category
'
                                                                   },
                                              'addProjectToCategory' => {
                                                                          'since' => '"4.3-SP1"',
                                                                          'returns' => '',
                                                                          'content' => 'Add a given project to a category.
'
                                                                        },
                                              'getRootCategoryData' => {
                                                                         'since' => '"4.3-SP1"',
                                                                         'returns' => 'Detailed data on the root category.',
                                                                         'content' => 'Returns a data object for the root category
'
                                                                       }
                                            },
          'TeamForge::NewsApp' => {
                                    'createNewsPost' => {
                                                          'since' => '4.1',
                                                          'returns' => 'Newly created new item data.',
                                                          'content' => 'Posts a news item to the project.
'
                                                        },
                                    'getAllNewsPostList' => {
                                                              'since' => '4.1',
                                                              'returns' => 'List of all news posts associated with users projects.',
                                                              'content' => 'Returns news for all user projects.
'
                                                            },
                                    'getNewsPostList' => {
                                                           'since' => '4.1',
                                                           'returns' => 'List of news posts associated with this project.',
                                                           'content' => 'Provides SOAP services for managing the file release system.

   Change HistoryVersion 4.4: No changes. Returns project news.
'
                                                         },
                                    'findNews' => {
                                                    'since' => '4.1',
                                                    'returns' => 'List of posts matching search criteria.',
                                                    'content' => 'Finds a list of news posts matching a search string.
'
                                                  },
                                    'deleteNewsPost' => {
                                                          'since' => '4.1',
                                                          'returns' => '',
                                                          'content' => 'Deletes a news post.
'
                                                        }
                                  },
          'TeamForge::WikiApp' => {
                                    'getWikiPageData' => {
                                                           'since' => '4.3',
                                                           'returns' => 'Wiki page data object.',
                                                           'content' => 'Get specified wiki page data.
'
                                                         },
                                    'getWikiPageList' => {
                                                           'since' => '4.3 SP1 HOTFIX1',
                                                           'returns' => 'wiki page list',
                                                           'content' => 'List all wiki pages that have contents witihn a project.
'
                                                         },
                                    'getWikiPageDataByName' => {
                                                                 'since' => '4.3',
                                                                 'returns' => 'Wiki page text in formatted form.',
                                                                 'content' => 'Get specified wiki page text in formatted (HTML) form. "HomePage" is the
   default Wiki application home page.
'
                                                               },
                                    'getFormattedWikiPageText' => {
                                                                    'since' => '4.3',
                                                                    'returns' => 'Wiki page text in formatted form.',
                                                                    'content' => 'Get specified wiki page text in formatted (HTML) form.
'
                                                                  },
                                    'createWikiPage' => {
                                                          'since' => '4.3',
                                                          'returns' => 'Wiki page data object.',
                                                          'content' => 'Provides SOAP web service for wiki application.

   Change HistoryVersion 4.4: No changes. Creates a new wiki page with
   the specified name, text, etc.
'
                                                        },
                                    'deleteWikiPage' => {
                                                          'since' => '4.3',
                                                          'returns' => '',
                                                          'content' => 'Deletes a wiki page.
'
                                                        },
                                    'setWikiPageData' => {
                                                           'since' => '4.3',
                                                           'returns' => '',
                                                           'content' => 'Sets specified wiki page data.
'
                                                         },
                                    'addAttachment' => {
                                                         'since' => '4.3',
                                                         'returns' => '',
                                                         'content' => 'Attaches the uploaded file to the specified wiki page. The attachment
   file id is retunred by one of the file storage services to upload the
   file (e.g. FileStorageApp or SimpleFileStorageApp service).
'
                                                       }
                                  },
          'TeamForge::SimpleFileStorageApp' => {
                                                 'startFileUpload' => {
                                                                        'since' => '4.1',
                                                                        'returns' => 'File descriptor key.',
                                                                        'content' => 'Provides SOAP web service for uploading/downloading files. Uploaded files
   are assigned a "tempoary session-specific key" which must be used
   within the SOAP session to create a document/FRS file/etc. Otherwise,
   the uploaded file is simply discarded. This service is primarily meant
   for clients which are unable to use SOAP file attachments for
   uploading/downloading files. Uploading/downloading files as
   attachments is much more efficient than returning them in memory. The
   "FileStorageApp" service provides support for uploading/downloading
   files as attachments.

   Change HistoryVersion 4.3: No changes. Opens a new file descriptor for
   uploading.
'
                                                                      },
                                                 'endFileUpload' => {
                                                                      'since' => '4.1',
                                                                      'returns' => '',
                                                                      'content' => 'Closes and saves uploaded file.
'
                                                                    },
                                                 'read' => {
                                                             'since' => '4.1',
                                                             'returns' => 'Data read from the file as a byte array. Returns null on file end.',
                                                             'content' => 'Reads from file a specified a number of bytes from the offset specified.
'
                                                           },
                                                 'getSize' => {
                                                                'since' => '4.1',
                                                                'returns' => 'File size in number of bytes.',
                                                                'content' => 'Returns size of the specified file in bytes.
'
                                                              },
                                                 'write' => {
                                                              'since' => '4.1',
                                                              'returns' => '',
                                                              'content' => 'Appends data to the file being uploaded.
'
                                                            }
                                               },
          'TeamForge::PageApp' => {
                                    'deletePageImage' => {
                                                           'since' => '5.3',
                                                           'returns' => '',
                                                           'content' => 'Deletes the specified attachment of the specified object.
'
                                                         },
                                    'setTextComponentContent' => {
                                                                   'since' => '5.0',
                                                                   'returns' => '',
                                                                   'content' => 'Sets the content of a Text component. The API replaces the existing HTML
   source of the text component with the new content. Note that only Text
   components are supported by this API.
'
                                                                 },
                                    'createPage' => {
                                                      'since' => '5.0',
                                                      'returns' => 'the newly created page',
                                                      'content' => 'Creates a new project page.
'
                                                    },
                                    'movePage' => {
                                                    'since' => '5.0',
                                                    'returns' => '',
                                                    'content' => 'Move a page (including sub pages and contents).
'
                                                  },
                                    'createComponent' => {
                                                           'since' => '5.0',
                                                           'returns' => 'the newly created component',
                                                           'content' => 'Creates a page component.
'
                                                         },
                                    'getPageList' => {
                                                       'since' => '5.0',
                                                       'returns' => 'list of pages for the user in the project',
                                                       'content' => 'Get all pages for a user in the specified project (in the correct order).
'
                                                     },
                                    'setPageData' => {
                                                       'since' => '5.0',
                                                       'returns' => '',
                                                       'content' => 'Edit an existing page. This API will not modify the component data.
'
                                                     },
                                    'setComponentDisplayOrder' => {
                                                                    'since' => '5.0',
                                                                    'returns' => '',
                                                                    'content' => 'Set the display order for components within a page
'
                                                                  },
                                    'getPageData' => {
                                                       'since' => '5.0',
                                                       'returns' => 'the page data',
                                                       'content' => 'Gets a project page. This API only fetches the page data and does not
   fetch the component contents.
'
                                                     },
                                    'getPageImageUrl' => {
                                                           'since' => '5.3',
                                                           'returns' => 'the relative url for the image.',
                                                           'content' => 'Gets relative url to access to the uploaded image from an html page. To
   embed an uploaded image in an html page, specify the string returned
   by this call as src in the img tag, no need to add protocol or server
   name as prefix.
'
                                                         },
                                    'getTextComponentContent' => {
                                                                   'since' => '5.0',
                                                                   'returns' => 'content of the text component as string',
                                                                   'content' => 'Gets the content of a Text component. The API fetches the HTML source of
   a text component. Note that only Text components are supported by this
   API.
'
                                                                 },
                                    'deletePageComponent' => {
                                                               'since' => '5.0',
                                                               'returns' => '',
                                                               'content' => 'Deletes an existing page component
'
                                                             },
                                    'setPageComponentData' => {
                                                                'since' => '5.0',
                                                                'returns' => '',
                                                                'content' => 'Updates a page component
'
                                                              },
                                    'addPageImage' => {
                                                        'since' => '5.3',
                                                        'returns' => 'attachment id of the added image',
                                                        'content' => 'Adds an uploaded file as an image for a page.
'
                                                      },
                                    'deletePage' => {
                                                      'since' => '5.0',
                                                      'returns' => '',
                                                      'content' => 'Deletes an existing page
'
                                                    },
                                    'getPageComponents' => {
                                                             'since' => '5.0',
                                                             'returns' => 'array of page components',
                                                             'content' => 'Get an array of page components for a page (in the correct order)
'
                                                           },
                                    'setPageDisplayOrder' => {
                                                               'since' => '5.0',
                                                               'returns' => 'true is the update went perfectly. false is the update succeeded, but had to deal with',
                                                               'content' => 'Set the page display order. This API will not modify the component data.
'
                                                             },
                                    'listPageImages' => {
                                                          'since' => '5.3',
                                                          'returns' => '',
                                                          'content' => 'Lists the images for a project.
'
                                                        }
                                  },
          'TeamForge::FrsApp' => {
                                   'createFrsFile' => {
                                                        'since' => '4.1',
                                                        'returns' => 'Newly created frs file object.',
                                                        'content' => 'Creates a new FRS file and adds it to the specified release.
'
                                                      },
                                   'getReleaseData' => {
                                                         'since' => '4.1',
                                                         'returns' => 'Release data.',
                                                         'content' => 'Returns the specified release deata.
'
                                                       },
                                   'getPackageData' => {
                                                         'since' => '4.1',
                                                         'returns' => 'Package object data.',
                                                         'content' => 'Returns package data.
'
                                                       },
                                   'getArtifactListReportedInRelease' => {
                                                                           'since' => '5.3',
                                                                           'returns' => 'List of the artifacts reported in the given release.',
                                                                           'content' => 'List artifacts that were found in the given release
'
                                                                         },
                                   'getFrsFileList' => {
                                                         'since' => '4.1',
                                                         'returns' => 'List of files within the specified release.',
                                                         'content' => 'Returns a list of files within a release.
'
                                                       },
                                   'deletePackage' => {
                                                        'since' => '4.1',
                                                        'returns' => '',
                                                        'content' => 'Deletes the specified package.
'
                                                      },
                                   'createPackage' => {
                                                        'since' => '4.1',
                                                        'returns' => 'Newly created package object.',
                                                        'content' => 'Provides SOAP services for managing the file release system.

   Change HistoryVersion 5.4

     * Added getArtifactListReportedInRelease2 to support the story
       points field

     * Added getArtifactListResolvedInRelease2 to support the story
       points field

   Version 5.3

     * getArtifactListReportedInRelease: New operation added in 5.3

     * getArtifactListResolvedInRelease: New operation added in 5.3

   Version 4.4

     * PackageSoapDO: Added new methods getIsPublished and setIsPublished

     * createPackage: Added new parameter to call in 4.4

     * createPackage2: Removed in 4.4. Use createPackage instead

     * isPackagePublished: Removed in 4.4. Use getPackageData and call
       PackageSoapDO.getIsPublished() instead

     * setPackagePublished: Removed in 4.4. Use
       PackageSoapDO.setIsPublished() and setPackageData instead

     * getReleaseDownloadCount: Removed in 4.4. Use getReleaseData and
       call ReleaseSoapDO.getDownloaded() instead

     * getPackageDownloadCount: Removed in 4.4. Use getPackageData and
       call PackageSoapDO.getDownloaded() instead

   Creates a new FRS package. Requires
   OperationConstants.FRSAPPFOLDER_CREATE_CREATEPACKAGE Change HistoryVersion
   4.4

     * Added additional parameter isPublished
'
                                                      },
                                   'getArtifactListResolvedInRelease' => {
                                                                           'since' => '5.3',
                                                                           'returns' => 'List of the artifacts resolved in the given release.',
                                                                           'content' => 'List artifacts that were resolved in the given release
'
                                                                         },
                                   'getArtifactListResolvedInRelease2' => {
                                                                            'since' => '5.4',
                                                                            'returns' => 'List of the artifacts resolved in the given release.',
                                                                            'content' => 'List artifacts that were resolved in the given release. The difference
   between this method and getArtifactListResolvedInRelease is that this
   returns Artifact3SoapList that adds the points information on the
   artifact
'
                                                                          },
                                   'getFrsFileData' => {
                                                         'since' => '4.2',
                                                         'returns' => 'the FRS file data.',
                                                         'content' => 'Gets FRS file data.
'
                                                       },
                                   'deleteFrsFile' => {
                                                        'since' => '4.1',
                                                        'returns' => '',
                                                        'content' => 'Deletes the specified file.
'
                                                      },
                                   'getReleaseList' => {
                                                         'since' => '4.1',
                                                         'returns' => 'List of releases within the specified package.',
                                                         'content' => 'Lists the releases within a specified package.
'
                                                       },
                                   'setPackageData' => {
                                                         'since' => '4.1',
                                                         'returns' => '',
                                                         'content' => 'Returns package data. Requires OperationConstants.PACKAGE_EDIT_EDIT
'
                                                       },
                                   'getArtifactListReportedInRelease2' => {
                                                                            'since' => '5.4',
                                                                            'returns' => 'List of the artifacts reported in the given release.',
                                                                            'content' => 'List artifacts that were found in the given release. The difference
   between this method and getArtifactListReportedInRelease is that this
   returns Artifact3SoapList that adds the points information on the
   artifact
'
                                                                          },
                                   'getPackageList' => {
                                                         'since' => '4.1',
                                                         'returns' => 'List of packages within the specified project.',
                                                         'content' => 'Lists packages within a project.
'
                                                       },
                                   'setReleaseData' => {
                                                         'since' => '4.1',
                                                         'returns' => '',
                                                         'content' => 'Sets the specified release deata.
'
                                                       },
                                   'getFrsFileId' => {
                                                       'since' => '4.1',
                                                       'returns' => 'File storage id (for download using FileStorageService or SimpleFileStorageService).',
                                                       'content' => 'Returns a temporary file storage object id to download an FRS file. The
   returned file storage id should be used with one of the file storage
   services to download the file (e.g. FileStorageApp or
   SimpleFileStorageApp service).
   IMPORTANT: The returned file id is valid ONLY during the session.
'
                                                     },
                                   'deleteRelease' => {
                                                        'since' => '4.1',
                                                        'returns' => '',
                                                        'content' => 'Deletes the specified release.
'
                                                      },
                                   'createRelease' => {
                                                        'since' => '4.1',
                                                        'returns' => 'Newly created release object.',
                                                        'content' => 'Creates a new release within a specified package.
'
                                                      }
                                 },
          'TeamForge::PlanningApp' => {
                                        'reorderPlanningFolders' => {
                                                                      'since' => '5.3',
                                                                      'returns' => '',
                                                                      'content' => 'Sets a new order for the planning folders in their parent folder. The
   planning folders will be listed in this new order in UI.
'
                                                                    },
                                        'movePlanningFolder' => {
                                                                  'since' => '5.3',
                                                                  'returns' => 'new planning folder object',
                                                                  'content' => 'Move a Planning Folder including its sub folders and contents. Fails if
   not everything can be moved.
'
                                                                },
                                        'createPlanningFolder2' => {
                                                                     'since' => '5.4',
                                                                     'returns' => 'the planning folder soap object',
                                                                     'content' => 'Creates a new planning folder
'
                                                                   },
                                        'createPlanningFolder' => {
                                                                    'since' => '5.3',
                                                                    'returns' => 'the planning folder soap object',
                                                                    'content' => 'Creates a new planning folder
'
                                                                  },
                                        'getPlanningFolderSummary2' => {
                                                                         'since' => '5.4',
                                                                         'returns' => 'Statistics for the artifacts in the PlanningFolder.',
                                                                         'content' => 'Returns the statistics for the artifacts in a given planning folder and
   all its sub planning folders
'
                                                                       },
                                        'getPlanningStatusValues' => {
                                                                       'since' => '5.4',
                                                                       'returns' => '',
                                                                       'content' => 'Gets status values for the planning application of a specific project.
'
                                                                     },
                                        'deletePlanningFolder' => {
                                                                    'since' => '5.3',
                                                                    'returns' => '',
                                                                    'content' => 'Deletes a planning folder with the specified id. All sub planning folders
   will be deleted as well. Tracker items in planning folder or sub
   planning folders will move up to the parent of the deleted planning
   folder or will lose their planning folder association at all if the
   deleted planning folder was a top-level folder.
'
                                                                  },
                                        'getPlanningFolder2List' => {
                                                                      'since' => '5.4',
                                                                      'returns' => 'List of filtered planning folder',
                                                                      'content' => 'Returns the list of planning folders within the specified project.
   Planning folders having the same parent are correctly ordered.
'
                                                                    },
                                        'getPlanningFolderData' => {
                                                                     'since' => '5.3',
                                                                     'returns' => 'Detailed data on the PlanningFolder.',
                                                                     'content' => 'Returns a data object for a given planning folder
'
                                                                   },
                                        'movePlanningFolder2' => {
                                                                   'since' => '5.4',
                                                                   'returns' => 'new planning folder object',
                                                                   'content' => 'Move a Planning Folder including its sub folders and contents. Fails if
   not everything can be moved.
'
                                                                 },
                                        'getArtifactListInPlanningFolder' => {
                                                                               'since' => '5.3',
                                                                               'returns' => 'List of artifacts contained in the planning folder/its',
                                                                               'content' => ' Returns the list of artifacts contained in a planning folder or its
   descendents.
'
                                                                             },
                                        'setPlanningStatusValues' => {
                                                                       'since' => '5.4',
                                                                       'returns' => '',
                                                                       'content' => 'Sets status values that is associated with the planning application of a
   specific project.
'
                                                                     },
                                        'getArtifactListInPlanningFolder2' => {
                                                                                'since' => '5.4',
                                                                                'returns' => 'List of artifacts contained in the planning folder/its',
                                                                                'content' => 'Returns the list of artifacts contained in a planning folder or its
   descendents. The difference between this call and
   getArtifactListInPlanningFolder is that the new list adds the story
   points, the status and the release.
'
                                                                              },
                                        'getPlanningFolderSummaryList' => {
                                                                            'since' => '5.3',
                                                                            'returns' => 'List of filtered planning folder',
                                                                            'content' => ' Returns the list of planning folders within the specified project
   including their statistics Planning folders having the same parent are
   correctly ordered.
'
                                                                          },
                                        'getPlanningFolder2Data' => {
                                                                      'since' => '5.4',
                                                                      'returns' => 'Detailed data on the PlanningFolder.',
                                                                      'content' => 'Returns a data object for a given planning folder
'
                                                                    },
                                        'setPlanningFolderData' => {
                                                                     'since' => '5.3',
                                                                     'returns' => '',
                                                                     'content' => 'Sets data on a specific planning folder.
'
                                                                   },
                                        'setPlanningFolder2Data' => {
                                                                      'since' => '5.4',
                                                                      'returns' => '',
                                                                      'content' => 'Sets data on a specific planning folder.
'
                                                                    },
                                        'getPlanningFolderList' => {
                                                                     'since' => '5.3',
                                                                     'returns' => 'List of filtered planning folder',
                                                                     'content' => ' Returns the list of planning folders within the specified project.
   Planning folders having the same parent are correctly ordered.
'
                                                                   },
                                        'getPlanningFolderSummary2List' => {
                                                                             'since' => '5.4',
                                                                             'returns' => 'List of filtered planning folder',
                                                                             'content' => 'Returns the list of planning folders within the specified project
   including their statistics Planning folders having the same parent are
   correctly ordered.
'
                                                                           },
                                        'getPlanningFolderSummary' => {
                                                                        'since' => '5.3',
                                                                        'returns' => 'Statistics for the artifacts in the PlanningFolder.',
                                                                        'content' => 'Returns the statistics for the artifacts in a given planning folder and
   all its sub planning folders
'
                                                                      }
                                      },
          'TeamForge::TrackerApp' => {
                                       'getParentDependency2List' => {
                                                                       'since' => '5.3',
                                                                       'returns' => 'dependency list',
                                                                       'content' => 'Get the dependency list for an artifact where the artifact is the target
   artifact. While in 5.3, an artifact can only have a single parent,
   that can be changed in future releases. Like getParentDependencyList
   but returns the tracker icon of the parent artifact as well.
'
                                                                     },
                                       'addDateField' => {
                                                           'since' => '4.3-SP1',
                                                           'returns' => '',
                                                           'content' => 'Adds a custom Date field to a tracker.
'
                                                         },
                                       'getArtifactList2' => {
                                                               'since' => '5.3',
                                                               'returns' => 'List of filtered artifacts.',
                                                               'content' => 'Returns a filtered list of artifacts within the specified container
   (project or tracker). Just like getArtifactList but returns a list of
   Artifact2SoapDO objects.
'
                                                             },
                                       'getArtifactDetailList2' => {
                                                                     'since' => '5.3',
                                                                     'returns' => 'List of filtered artifacts.',
                                                                     'content' => 'Just like getArtifactDetailList but it returns an ArtifactDetail2SoapList.
'
                                                                   },
                                       'getArtifactData' => {
                                                              'since' => '4.1',
                                                              'returns' => 'the data associated with the artifact at the given path',
                                                              'content' => 'Returns data associated with the specified artifact. Unlike the
   corresponding method in earlier versions of the soap interface
   (soap44, etc.), this method now returns data for all flex fields,
   whether they have values or not. Flex fields with no values will have
   NULL values in the values[] array
'
                                                            },
                                       'getArtifactList3' => {
                                                               'since' => '5.4',
                                                               'returns' => 'List of filtered artifacts.',
                                                               'content' => 'Returns a filtered list of artifacts within the specified container
   (project or tracker). Just like getArtifactList2 but returns a list of
   Artifact3SoapRow objects.
'
                                                             },
                                       'createArtifact' => {
                                                             'since' => '4.1',
                                                             'returns' => 'Newly created artifact object.',
                                                             'content' => 'Creates a new artifact. Change HistoryVersion 4.2

     * Added additional paramters for an attachment.
'
                                                           },
                                       'getArtifactData2' => {
                                                               'since' => '5.3',
                                                               'returns' => 'the data associated with the artifact at the given path',
                                                               'content' => 'Returns data associated with the specified artifact but unlike
   getArtifactData, this method returns an Artifact2SoapDO.
'
                                                             },
                                       'createTracker2' => {
                                                             'since' => '5.3',
                                                             'returns' => 'the tracker soap object',
                                                             'content' => 'Creates a new tracker with an icon
'
                                                           },
                                       'getAllowedWorkflowTransitionList' => {
                                                                               'since' => '4.3',
                                                                               'returns' => 'Workflow definitions list. For requiredFields property of workflow definition, following special',
                                                                               'content' => 'Get workflow transitions for the tracker.
   Change HistoryVersion 4.4 SP 1

     * Added the missing [new artifact] transitions to the list

     *  The returning list now will contain [new artifact] transition
       list with the following format [from value] [to value] null open
       null close null pending
'
                                                                             },
                                       'getParentDependencyList' => {
                                                                      'since' => '4.4',
                                                                      'returns' => 'dependency list',
                                                                      'content' => 'Get the dependency list for an artifact where the artifact is the target
   artifact. While in 5.3, an artifact can only have a single parent,
   that can be changed in future releases.
'
                                                                    },
                                       'copyWorkflowTransitions' => {
                                                                      'since' => '4.3-SP1-HOTFIX3',
                                                                      'returns' => '',
                                                                      'content' => 'Copy workflow transitions between two trackers. In order for this
   operation to succeed, the following conditions must be met: - caller
   needs to have tracker admin permission for both srTracker and
   destTracker - every transition req role in srcTracker must have
   corresponding role with the same name in dstTracker - every transition
   req field in srcTracker must have corresponding field with the same
   name in dstTracker or be a custom field name.
'
                                                                    },
                                       'getChildDependencyList' => {
                                                                     'since' => '4.4',
                                                                     'returns' => 'dependency list',
                                                                     'content' => 'Get the dependency list for an artifact where the artifact is the origin
   artifact.
'
                                                                   },
                                       'createTracker' => {
                                                            'since' => '4.3-HOTFIX1',
                                                            'returns' => 'the tracker soap object',
                                                            'content' => 'Creates a new tracker
'
                                                          },
                                       'findArtifacts2' => {
                                                             'since' => '5.3',
                                                             'returns' => 'List of artifacts matching search criteria.',
                                                             'content' => 'Finds a list of artifacts matching a search string but unlike
   findArtifacts, this method returns an Artifact2SoapList.
'
                                                           },
                                       'setTracker2Data' => {
                                                              'since' => '5.3',
                                                              'returns' => '',
                                                              'content' => 'Sets data on a specific tracker
'
                                                            },
                                       'findArtifacts3' => {
                                                             'since' => '5.4',
                                                             'returns' => 'List of artifacts matching search criteria.',
                                                             'content' => 'Finds a list of artifacts matching a search string but unlike
   findArtifacts, this method returns an Artifact3SoapList.
'
                                                           },
                                       'moveArtifact' => {
                                                           'since' => '4.2',
                                                           'returns' => 'New artifact data object',
                                                           'content' => 'Moves an artifact to a specified target folder.
'
                                                         },
                                       'getArtifactList' => {
                                                              'since' => '4.1',
                                                              'returns' => 'List of filtered artifacts.',
                                                              'content' => 'Returns a filtered list of artifacts within the specified container
   (project or tracker). See ArtifactSoapDO for filter constant values:
   ArtifactSoapDO.FILTER_ASSIGNED_TO, etc.
   Change HistoryVersion 4.2

     * Added additional parameter (filters) for filtering artifact lists.

   Version 4.4

     * Added a limit to the number of rows that could be retreived. This
       limit is by default 5000 but is configurable

     * it is substantially obselete by enhancements to
       getArtifactDetailList(), which now includes the ability to select
       which columns are returned, as well as the ability to fetch
       subsets of data on a "paged" basis, and to return sorted results.
'
                                                            },
                                       'getArtifactData3' => {
                                                               'since' => '5.4',
                                                               'returns' => 'the data associated with the artifact at the given path',
                                                               'content' => 'Returns data associated with the specified artifact but unlike
   getArtifact2Data, this method returns an Artifact3SoapDO.
'
                                                             },
                                       'moveArtifact3' => {
                                                            'since' => '5.4',
                                                            'returns' => 'New artifact data object',
                                                            'content' => 'Moves an artifact to a specified target folder but unlike moveArtifact2,
   this method works on Artifact3SoapDOobjects.
'
                                                          },
                                       'getCrossTrackerArtifactList' => {
                                                                          'since' => '5.3',
                                                                          'returns' => 'List of filtered artifacts.',
                                                                          'content' => 'Returns a filtered list of artifacts within the specified container
   (project or tracker). Just like getArtifactList but returns a list of
   ArtifactDetail2SoapDO objects that includes tracker specific
   information. Since this is a cross tracker query, flex fields may not
   be populated.
'
                                                                        },
                                       'getTracker2List' => {
                                                              'since' => '5.3',
                                                              'returns' => 'List of trackers within the project.',
                                                              'content' => 'Returns a list of trackers for a project in the order that they are
   displayed in the UI.
'
                                                            },
                                       'setField2' => {
                                                        'since' => '5.3',
                                                        'returns' => '',
                                                        'content' => 'Sets a custom/flex-field that is associated with a specific folder (e.g.
   tracker). This method was introduced to be able to set properties of
   the planning folder, the actual, estimated and the remaining effort
   field introduced in TeamForge 5.3
'
                                                      },
                                       'getChildDependency2List' => {
                                                                      'since' => '5.3',
                                                                      'returns' => 'dependency list',
                                                                      'content' => 'Get the dependency list for an artifact where the artifact is the origin
   artifact. Like getChildDependencyList but returns the tracker icon of
   the children artifact as well.
'
                                                                    },
                                       'moveArtifact2' => {
                                                            'since' => '5.3',
                                                            'returns' => 'New artifact data object',
                                                            'content' => 'Moves an artifact to a specified target folder but unlike moveArtifact,
   this method works on Artifact2SoapDOobjects.
'
                                                          },
                                       'setArtifactData' => {
                                                              'since' => '4.1',
                                                              'returns' => '',
                                                              'content' => 'Sets data associated with the specified artifact. Change HistoryVersion
   4.2

     * Added additional paramters for an attachment.
'
                                                            },
                                       'getArtifactDetailList3' => {
                                                                     'since' => '5.4',
                                                                     'returns' => 'List of filtered artifacts.',
                                                                     'content' => 'Just like getArtifactDetailList2 but it returns an
   ArtifactDetail3SoapList.
'
                                                                   },
                                       'findArtifacts' => {
                                                            'since' => '4.1',
                                                            'returns' => 'List of artifacts matching search criteria.',
                                                            'content' => 'Finds a list of artifacts matching a search string.
'
                                                          },
                                       'getTracker2Data' => {
                                                              'since' => '"5.3"',
                                                              'returns' => 'Detailed data on the tracker.',
                                                              'content' => 'Returns a data object for a given tracker
'
                                                            },
                                       'setArtifactData2' => {
                                                               'since' => '5.3',
                                                               'returns' => '',
                                                               'content' => 'Sets data associated with the specified artifact but unlike
   setArtifactData, this method operates on an Artifact2SoapDO.
'
                                                             },
                                       'createArtifact3' => {
                                                              'since' => '5.4',
                                                              'returns' => 'Newly created artifact object.',
                                                              'content' => 'Creates a new artifact but unlike createArtifact2, this method lets you
   set the story points field and returns a Artifact3SoapDO.
'
                                                            },
                                       'deleteArtifact' => {
                                                             'since' => '4.1',
                                                             'returns' => '',
                                                             'content' => 'Deletes an artifact.
'
                                                           },
                                       'setArtifactData3' => {
                                                               'since' => '5.4',
                                                               'returns' => '',
                                                               'content' => 'Sets data associated with the specified artifact but unlike
   setArtifactData2, this method operates on an Artifact3SoapDO.
'
                                                             },
                                       'reorderTrackers' => {
                                                              'since' => '5.4',
                                                              'returns' => '',
                                                              'content' => 'Sets a new order of the trackers within a project. The trackers will be
   listed in this new order in UI and in the methods that list the
   trackers in the SOAP calls.
'
                                                            },
                                       'getFields2' => {
                                                         'since' => '5.3',
                                                         'returns' => 'Array of all field values.',
                                                         'content' => 'Returns the custom/flex-fields associated with a specific tracker. This
   method has been introduced to also return the properties of the
   planning folder, the actual, estimated and remaining effort fields as
   well as the autosumming flag.
'
                                                       },
                                       'getTrackerList' => {
                                                             'since' => '4.1',
                                                             'returns' => 'List of trackers within the project.',
                                                             'content' => 'Returns a list of trackers for a project in the order they are displayed
   in the UI.
'
                                                           },
                                       'createArtifactDependency' => {
                                                                       'since' => '4.4',
                                                                       'returns' => '',
                                                                       'content' => 'Create an artifact dependency between two artifacts. If an existing
   artifact dependency already exists, the descriptions are simply
   overriden.
'
                                                                     },
                                       'removeArtifactDependency' => {
                                                                       'since' => '4.4',
                                                                       'returns' => '',
                                                                       'content' => 'Remove an artifact dependency between two artifacts.
'
                                                                     },
                                       'getFields' => {
                                                        'since' => '4.3-HOTFIX1',
                                                        'returns' => 'Array of all field values.',
                                                        'content' => 'Returns the custom/flex-fields associated with a specific tracker.
'
                                                      },
                                       'copyWorkflowTransitions2' => {
                                                                       'since' => '5.3',
                                                                       'returns' => '',
                                                                       'content' => 'Copy workflow transitions between two trackers. (Just like
   copyWorkflowTransitions but reports effort errors insteads of hours
   errors). In order for this operation to succeed, the following
   conditions must be met: - caller needs to have tracker admin
   permission for both srTracker and destTracker - every transition req
   role in srcTracker must have corresponding role with the same name in
   dstTracker - every transition req field in srcTracker must have
   corresponding field with the same name in dstTracker or be a custom
   field name.
'
                                                                     },
                                       'addUserSelectField' => {
                                                                 'since' => '4.3-SP1',
                                                                 'returns' => '',
                                                                 'content' => 'Adds a custom User selection field to a tracker.
'
                                                               },
                                       'createArtifact2' => {
                                                              'since' => '5.3',
                                                              'returns' => 'Newly created artifact object.',
                                                              'content' => 'Creates a new artifact but unlike createArtifact, this method lets you
   set the remaining effort, planning folder and autosumming flag at
   creation time and returns a Artifact2SoapDO.
'
                                                            },
                                       'getCrossTrackerArtifactList2' => {
                                                                           'since' => '5.4',
                                                                           'returns' => 'List of filtered artifacts.',
                                                                           'content' => 'Returns a filtered list of artifacts within the specified container
   (project or tracker). Just like getCrossTrackerArtifactList but
   returns a list of ArtifactDetail3SoapDO objects that includes the
   points information. Since this is a cross tracker query, flex fields
   may not be populated.
'
                                                                         },
                                       'setField' => {
                                                       'since' => '4.3-HOTFIX1',
                                                       'returns' => '',
                                                       'content' => 'Sets a custom/flex-field that is associated with a specific folder (e.g.
   tracker).
'
                                                     },
                                       'setTrackerData' => {
                                                             'since' => '4.2',
                                                             'returns' => '',
                                                             'content' => 'Sets data on a specific tracker
'
                                                           },
                                       'getTrackerData' => {
                                                             'since' => '"4.2"',
                                                             'returns' => 'Detailed data on the tracker.',
                                                             'content' => 'Returns a data object for a given tracker
'
                                                           },
                                       'getArtifactDetailList' => {
                                                                    'since' => '4.3-HOTFIX1 Heavily modified in 4.4 to add paging, sorting and column selection.',
                                                                    'returns' => 'List of filtered artifacts.',
                                                                    'content' => 'Returns a filtered and ordered list of artifacts from the specified
   tracker. It gives the user the ability to ask only for certain results
   with the parameters startIndex and maxRows. In this way the method can
   be used to implement paging. A special value of -1 for the maxRows
   parameter will be interpreted as asking for the complete list,
   ignoring the value in startIndex. Unlike the corresponding method in
   earlier versions of the soap interface (soap44, etc.), this method now
   returns data for all flex fields, whether they have values or not.
   Flex fields with no values will have NULL values in the values[] array

   This method makes use of server-side caching of the complete list in
   order to more efficiently return results for requests for subsequent
   "pages" of data. In normal usage, requesting a subsequent page of a
   given list will return data from this cache unless the cache has
   expired, in which case the query will transparently be re-executed
   before return the results. Note that this transparent re-execution can
   result in slight inconsistencies in the data, if the underlying data
   has changed. The exceptionIfExpiredCache and forceNewQuery flags can
   be used to tune cache behavior.

   Caching is managed transparently by the application server, using the
   filters and selectedColumns parameters to identify subsequent requests
   for subsets of the same data set. The cache is associated with the
   user session. Note that the implementation may choose not to cache
   results if the entire list is being fetched (via specifying -1 for
   maxRows).

   See ArtifactSoapDO for column and filter names constant values:
   ArtifactSoapDO.COLUMN_TITLE, ArtifactSoapDO.COLUMN_ASSIGNED_TO,
   FILTER_PRIORITY, FILTER, FILTER_CATEGORY, etc.
'
                                                                  }
                                     }
        };


    bless $VAR1;

}

sub service {
    my $self = shift;
    my $svc  = shift;
    bless $self->{ $svc }, "TUD::Methods";
}

package TUD::Methods;

sub method {
    my $self = shift;
    my $name = shift;
    bless $self->{ $name }, "TUD::Attribs";
}

package TUD::Attribs;

sub since   { $_[0]->{ since   } };
sub returns { $_[0]->{ returns } };
sub content { $_[0]->{ content } };

1;

