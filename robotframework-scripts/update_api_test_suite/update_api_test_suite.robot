*** Settings ***
Library   Collections
Library   RequestsLibrary
Library   Selenium2Library

*** Variables ***
${Browser}        Firefox

${update_landinfo_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=update&object=landinfo?name=essa&recorder_name=imhmed&test_plot=true&latitude=1&longitude=2&slope=1&slope_shape=2&surface_salt=true&surface_cracking=true

${Delay}          5s

*** Test Cases ***
update_landinfo_testCase
        Get a request for update_landinfo

*** Keywords ***
Get a request for login
        Create Session   Land   ${update_landinfo_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   500