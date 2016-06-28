*** Settings ***
Library   Collections
Library   RequestsLibrary
Library   Selenium2Library

*** Variables ***
${Browser}        Firefox

${put_landcover_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=put&object=landcover?name=essa&recorder_name=imhmed&transect=20&segment=10&canopy_gap=true&basal_gap=true

${delete_landcover_by_id_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=delete&object=landcover&type=delete_by_id?id=1

${delete_landcover_by_name_recorder_name_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=delete&object=landcover&type=delete_by_name_recorder_name?recorder_name=essa&name=imhmed

${get_all_landcover_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landcover&type=get_all&recorder_name=all

${get_landcover_by_name_recorder_name_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landcover&type=get_by_name_recorder_name?name=Essa&recorder_name=Imhmed

${get_landcover_by_recorder_name_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landcover&type=get_by_recorder_name?recorder_name=Imhmed

${get_landcover_by_afterdate_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landcover&type=get_by_afterdate?after_date=12-12-2012

${get_landcover_by_beforedate_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landcover&type=get_by_beforedate?before_date=12-12-2012

${get_landcover_by_afterdate_beforedate_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landcover&type=get_by_afterdate_beforedate?after_date=12-12-2012&before_date=12-12-2010

${Delay}          5s

*** Test Cases ***
put_landcover_testCase
        Get a request for put_landcover
delete_landcover_by_id_testCase
        Get a request for delete_landcover_by_id
delete_landcover_by_name_recorder_name_testCase
        Get a request for delete_landcover_by_name_recorder_name
get_all_landcover_testCase
        Get a request for get_all_landcover
get_landcover_by_name_recorder_name_testCase
        Get a request for get_landcover_by_name_recorder_name
get_landcover_by_recorder_name_testCase
        Get a request for get_landcover_by_recorder_name
get_landcover_by_afterdate_testCase
        Get a request for get_landcover_by_afterdate
get_landcover_by_beforedate_testCase
        Get a request for get_landcover_by_beforedate
get_landcover_by_afterdate_beforedate_testCase
        Get a request for get_landcover_by_afterdate_beforedate

*** Keywords ***
Get a request for put_landcover
        Create Session   Land   ${put_landcover_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for delete_landcover_by_id
        Create Session   Land   ${delete_landcover_by_id_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for delete_landcover_by_name_recorder_name
        Create Session   Land   ${delete_landcover_by_name_recorder_name_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for get_all_landcover
        Create Session   Land   ${get_all_landcover_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for get_landcover_by_name_recorder_name
        Create Session   Land   ${get_landcover_by_name_recorder_name_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for get_landcover_by_recorder_name
        Create Session   Land   ${get_landcover_by_recorder_name_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for get_landcover_by_afterdate
        Create Session   Land   ${get_landcover_by_afterdate_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for get_landcover_by_beforedate
        Create Session   Land   ${get_landcover_by_beforedate_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for get_landcover_by_afterdate_beforedate
        Create Session   Land   ${get_landcover_by_afterdate_beforedate_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400