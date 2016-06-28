*** Settings ***
Library   Collections
Library   RequestsLibrary
Library   Selenium2Library

*** Variables ***
${Browser}        Firefox

${get_localclimate_SiteUrl}   http://api.landpotential.org/query?version=0.1&action=get&object=climate&type=get_local_climate?latitude=1&longitude=2

${Delay}          5s

*** Test Cases ***
get_localclimate_testCase
        Get a request for get_localclimate

*** Keywords ***
Get a request for get_localclimate
        Create Session   Land   ${get_localclimate_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   400