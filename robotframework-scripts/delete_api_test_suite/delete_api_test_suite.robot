*** Settings ***
Library   Collections
Library   RequestsLibrary
Library   Selenium2Library

*** Variables ***
${Browser}        Firefox

${landinfo_delete_by_id_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=delete&object=landinfo&type=delete_by_id?id=468

${landcover_delete_by_id_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=delete&object=landcover&type=delete_by_id?id=1

${landcover_delete_by_name_recorder_name_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=delete&object=landcover&type=delete_by_name_recorder_name?recorder_name=dsfdf&name=f4rrr

${landinfo_delete_by_name_recorder_name_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&object=landinfo&type=delete_by_name_recorder_name?recorder_name=essa&name=imhmed

${Delay}          5s

*** Test Cases ***
landinfo_delete_by_id_testCase
        Get a request for landinfo_delete_by_id
landcover_delete_by_id_testCase
        Get a request for landcover_delete_by_id
landcover_delete_by_name_recorder_name_testCase
        Get a request for landcover_delete_by_name_recorder_name
landinfo_delete_by_name_recorder_name_testCase
        Get a request for landinfo_delete_by_name_recorder_name       

*** Keywords ***
Get a request for landinfo_delete_by_id
        Create Session   Land   ${landinfo_delete_by_id_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for landcover_delete_by_id
        Create Session   Land   ${landcover_delete_by_id_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for landcover_delete_by_name_recorder_name
        Create Session   Land   ${landcover_delete_by_name_recorder_name_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for landinfo_delete_by_name_recorder_name
        Create Session   Land   ${landinfo_delete_by_name_recorder_name_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400