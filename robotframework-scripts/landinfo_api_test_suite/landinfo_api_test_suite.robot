*** Settings ***
Library   Collections
Library   RequestsLibrary
Library   Selenium2Library

*** Variables ***
${Browser}        Firefox

${update_landinfo_SiteUrl}   http://testtestapi.landpotential.org:8080:8080/query?version=0.1&action=update&object=landinfo?name=Essa&recorder_name=Imhmed&test_plot=true&latitude=10&longitude=30&slope=1&slope_shape=2&surface_salt=true&surface_cracking=true

${put_landinfo_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=put&object=landinfo?name=Essa&recorder_name=Imhmed&test_plot=true&latitude=10&longitude=30&slope=1&slope_shape=2&surface_salt=true&surface_cracking=true

${delete_landinfo_by_id_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=delete&object=landinfo&type=delete_by_id?id=1

${delete_landinfo_by_name_recorder_name_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=delete&object=landinfo&type=delete_by_name_recorder_name?recorder_name=Essa&name=Imhmed

${get_all_landinfo_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landinfo&type=get_all&recorder_name=all?delimiter=50&display=50

${get_landinfo_by_id_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landinfo&type=get_by_id?id=1

${get_landinfo_by_pair_name_recorder_name_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landinfo&type=get_by_pair_name_recorder_name?name=Essa&recorder_name=Imhmed

${get_landinfo_by_recorder_name_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landinfo&type=get_by_recorder_name?recorder_name=Imhmed

${get_landinfo_by_region_recorder_name_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landinfo&type=get_by_region_recorder_name?recorder_name=Imhmed&minlat=1&minlong=2&maxlat=3&maxlong=4

${get_landinfo_by_afterdate_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landinfo&type=get_by_afterdate?after_date=12-12-2012

${get_landinfo_by_beforedate_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landinfo&type=get_by_beforedate?before_date=12-12-2012

${get_landinfo_by_beforedate_afterdate_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landinfo&type=get_by_beforedate_afterdate?before_date=12-12-2012&after_date=12-12-2012

${Delay}          5s

*** Test Cases ***
update_landinfo_testCase
        Get a request for update_landinfo
put_landinfo_testCase
        Get a request for put_landinfo
delete_landinfo_by_id_testCase
        Get a request for delete_landinfo_by_id
delete_landinfo_by_name_recorder_name_testCase
        Get a request for delete_landinfo_by_name_recorder_name
get_all_landinfo_testCase
        Get a request for get_all_landinfo
get_landinfo_by_id_testCase
        Get a request for get_landinfo_by_id
get_landinfo_by_pair_name_recorder_name_testCase
        Get a request for get_landinfo_by_pair_name_recorder_name
get_landinfo_by_recorder_name_testCase
        Get a request for get_landinfo_by_recorder_name
get_landinfo_by_region_recorder_name_testCase
        Get a request for get_landinfo_by_region_recorder_name
get_landinfo_by_afterdate_testCase
        Get a request for get_landinfo_by_afterdate
get_landinfo_by_beforedate_testCase
        Get a request for get_landinfo_by_beforedate
get_landinfo_by_beforedate_afterdate_testCase
        Get a request for get_landinfo_by_beforedate_afterdate

*** Keywords ***
Get a request for update_landinfo
        Create Session   Land   ${delete_landinfo_by_id_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for put_landinfo
        Create Session   Land   ${put_landinfo_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for delete_landinfo_by_id
        Create Session   Land   ${delete_landinfo_by_id_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for delete_landinfo_by_name_recorder_name
        Create Session   Land   ${delete_landinfo_by_name_recorder_name_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for get_all_landinfo
        Create Session   Land   ${get_all_landinfo_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for get_landinfo_by_id
        Create Session   Land   ${get_landinfo_by_id_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for get_landinfo_by_pair_name_recorder_name
        Create Session   Land   ${get_landinfo_by_pair_name_recorder_name_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for get_landinfo_by_recorder_name
        Create Session   Land   ${get_landinfo_by_recorder_name_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for get_landinfo_by_region_recorder_name
        Create Session   Land   ${get_landinfo_by_region_recorder_name_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for get_landinfo_by_afterdate
        Create Session   Land   ${get_landinfo_by_afterdate_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for get_landinfo_by_beforedate
        Create Session   Land   ${get_landinfo_by_beforedate_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Get a request for get_landinfo_by_beforedate_afterdate
        Create Session   Land   ${get_landinfo_by_beforedate_afterdate_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
