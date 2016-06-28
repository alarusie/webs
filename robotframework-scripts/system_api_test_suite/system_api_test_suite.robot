*** Settings ***
Library   Collections
Library   RequestsLibrary
Library   Selenium2Library

*** Variables ***
${Browser}        Firefox

${login_SiteUrl}   http://testapi.landpotential.org:8080/auth/api_login?email=Landpks%40gmail.com&password=12345

${Delay}          5s

*** Test Cases ***
login_testCase
        Get a request for login

*** Keywords ***
Get a request for login
        Create Session   Land   ${login_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   500