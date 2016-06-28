*** Settings ***
Library           test.py

*** Variables ***
${landinfo_get_all&recorder_name_SiteUrl}    http://testapi.landpotential.org:8080/query?version=0.1&action=get&object=landinfo&type=get_all&recorder_name=all?delimiter=50&display=50

*** Test Cases ***
Test python connection
    hello world    ${landinfo_get_all&recorder_name_SiteUrl}
