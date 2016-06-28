*** Settings ***
Library   Collections
Library   RequestsLibrary
Library   Selenium2Library

*** Variables ***
${Browser}        Firefox

${put_landinfo_SiteUrl}   http://testapi.landpotential.org:8080/query?version=0.1&action=put&object=landinfo?name=essa&recorder_name=imhmed&test_plot=true&latitude=10&longitude=30&slope=1&slope_shape=2&surface_salt=true&surface_cracking=true

${put_landcover_SiteUrl}   http://api.landpotential.org/query?version=0.1&action=put&object=landcover?name=essa&recorder_name=imhmed&transect=1&segment=2&canopy_gap=true&basal_gap=true

${Delay}          5s

*** Test Cases ***
put_landinfo_testCase
        Get a request for put_landinfo
put_landcover_testCase
        Get a request for put_landcover

*** Keywords ***
Get a request for put_landinfo
        Create Session   Land   ${put_landinfo_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   500
Get a request for put_landcover
        Create Session   Land   ${put_landcover_SiteUrl}
        ${resp}=   Get Request   Land   /
        Should Be Equal As Strings   ${resp.status_code}   500