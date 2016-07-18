*** Settings ***
Documentation     A test suite containing tests related to users logging into DM.
...
...               These tests are data-driven by nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
Test Setup        Open Browser To Login Page
Test teardown     Close Browser
Test Template     Login With Credentials Should Pass
Resource          ../resource/dec_resource.robot

*** Test Cases ***    USERNAME                          PASSWORD
lexmark_installer     signage.installer@lexmarkqa.com   password
admin                 signage.admin@lexmarkqa.com       password

*** Keywords ***
Login With Credentials Should Pass
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
    User Page Should Be Open

Login Should Have passed
    Location Should Be    ${ERROR URL}
    Title Should Be    Login

