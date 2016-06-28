*** Settings ***
Library   Collections
Library   RequestsLibrary
Library   Selenium2Library

*** Variables ***
${Browser}        Firefox

${landinfo_get_all&recorder_name_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landinfo&type=get_all&recorder_name=all?delimiter=50&display=50

${landinfo_get_by_id_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landinfo&type=get_by_id?id=1

${landinfo_get_by_pair_name_recorder_name_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landinfo&type=get_by_pair_name_recorder_name?name=test1&recorder_name=lpks.test%40gmail.com

${landinfo_get_by_recorder_name_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landinfo&type=get_by_recorder_name?recorder_name=lpks.test%40gmail.com

${landinfo_get_by_region_recorder_name_SiteUrl}   http://api.landpotential.org/query?version=0.1&action=get&object=landinfo&type=get_by_region_recorder_name?recorder_name=testpks&minlat=30&minlong=50&maxlat=20&maxlong=60

${landinfo_get_by_afterdate_SiteUrl}    http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landinfo&type=get_by_afterdate?after_date=2010-01-01

${landinfo_get_by_beforedate_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landinfo&type=get_by_beforedate?before_date=2010-11-12

${landinfo_get_by_beforedate_afterdate_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landinfo&type=get_by_beforedate_afterdate?before_date=2010-01-01&after_date=2010-12-01

${landcover_get_all&recorder_name=all_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landcover&type=get_all&recorder_name=all

${landcover_get_by_name_recorder_name_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landcover&type=get_by_name_recorder_name?name=test1&recorder_name=lpks.test%40gmail.com

${landcover_get_by_recorder_name_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landcover&type=get_by_recorder_name?recorder_name=lpks.test%2540gmail.com

${landcover_get_by_afterdate_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landcover&type=get_by_afterdate?after_date=2009-10-10

${landcover_get_by_beforedate_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landcover&type=get_by_beforedate?before_date=2009-10-10

${landcover_get_by_afterdate_beforedate_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landcover&type=get_by_afterdate_beforedate?after_date=2009-10-10&before_date=2010-10-10

${Delay}          5s

*** Test Cases ***
landinfo_Get_all&recorder_name_testCase
        Open Browser for landinfo_get_all&recorder_name
landinfo_Get_by_id_TestCase
        Open Browser for landinfo_get_by_id
        sleep    ${Delay}
landinfo_Get_by_recorder_name_TestCase
        Open Browser for landinfo_get_by_recorder_name
        sleep    ${Delay}
landinfo_Get_by_region_recorder_name_TestCase
        Open Browser for landinfo_get_by_region_recorder_name
        sleep    ${Delay}
landinfo_Get_by_pair_name_recorder_name_TestCase
        Open Browser for landinfo_get_by_pair_name_recorder_name
        sleep    ${Delay}
landinfo_Get_by_afterdate_TestCase
        Open Browser for landinfo_Get_by_afterdate
        sleep    ${Delay}
landinfo_Get_by_beforedate_TestCase
        Open Browser for landinfo_Get_by_beforedate
        sleep    ${Delay}
landinfo_Get_by_beforedate_afterdate_TestCase
        Open Browser for landinfo_Get_by_beforedate_afterdate
        sleep    ${Delay}
landcover_Get_all&recorder_name=all_TestCase
        Open Browser for landcover_Get_all&recorder_name=all
        sleep    ${Delay}
landcover_Get_by_name_recorder_name_TestCase
        Open Browser for landcover_Get_by_name_recorder_name
        sleep    ${Delay}
landcover_get_by_afterdate_TestCase
        Open Browser for landcover_get_by_afterdate
        sleep    ${Delay}
landcover_get_by_beforedate_TestCase
        Open Browser for landcover_get_by_beforedate
        sleep    ${Delay}
landcover_get_by_afterdate_beforedate_TestCase
        Open Browser for landcover_get_by_afterdate_beforedate
        sleep    ${Delay}

*** Keywords ***
Open Browser for landinfo_get_all&recorder_name
        Create Session   Land   ${landinfo_get_all&recorder_name_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   200
Open Browser for landinfo_get_by_id
        Create Session   Land   ${landinfo_get_by_id_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   404
Open Browser for landinfo_get_by_recorder_name
        Create Session   Land   ${landinfo_get_by_recorder_name_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   404
Open Browser for landinfo_get_by_region_recorder_name
        Create Session   Land   ${landinfo_get_by_region_recorder_name_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Open Browser for landinfo_get_by_pair_name_recorder_name
        Create Session   Land   ${landinfo_get_by_pair_name_recorder_name_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   200
Open Browser for landinfo_Get_by_afterdate
        Create Session   Land   ${landinfo_get_by_afterdate_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   404
Open Browser for landinfo_Get_by_beforedate
        Create Session   Land   ${landinfo_get_by_beforedate_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   404
Open Browser for landinfo_Get_by_beforedate_afterdate
        Create Session   Land   ${landinfo_get_by_beforedate_afterdate_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400
Open Browser for landcover_Get_all&recorder_name=all
        Create Session   Land   ${landcover_get_all&recorder_name=all_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   200
Open Browser for landcover_Get_by_name_recorder_name
        Create Session   Land   ${landcover_get_by_name_recorder_name_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   200
Open Browser for landcover_get_by_afterdate
        Create Session   Land   ${landcover_get_by_afterdate_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   404
Open Browser for landcover_get_by_beforedate
        Create Session   Land   ${landcover_get_by_beforedate_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   404
Open Browser for landcover_get_by_afterdate_beforedate
        Create Session   Land   ${landcover_get_by_afterdate_beforedate_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400