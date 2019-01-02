@files = (
    ['//property[propertyName="ECDefectTracking::TeamForge::Cfg"]/value', 'TeamForgeCfg.pm'],
    ['//property[propertyName="ECDefectTracking::TeamForge::Driver"]/value', 'TeamForgeDriver.pm'],
    ['//property[propertyName="createConfig"]/value', 'teamForgeCreateConfigForm.xml'],
    ['//property[propertyName="editConfig"]/value', 'teamForgeEditConfigForm.xml'],
    ['//property[propertyName="ec_setup"]/value', 'ec_setup.pl'],
	['//procedure[procedureName="LinkDefects"]/propertySheet/property[propertyName="ec_parameterForm"]/value', 'ec_parameterForm-LinkDefects.xml'],	
	['//procedure[procedureName="UpdateDefects"]/propertySheet/property[propertyName="ec_parameterForm"]/value', 'ec_parameterForm-UpdateDefects.xml'],	
	['//procedure[procedureName="CreateDefects"]/propertySheet/property[propertyName="ec_parameterForm"]/value', 'ec_parameterForm-CreateDefects.xml'],		
);
