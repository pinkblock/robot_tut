*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Fail
Resource          ../resource/dec_resource.robot

*** Test Cases ***    USERNAME             PASSWORD
Invalid Username      invalid              ${VALID PASSWORD}
Invalid Password      ${VALID USERNAME}    invalid
Invalid Both          invalid              invalid
Empty Username        ${EMPTY}             ${VALID PASSWORD}
Empty Password        ${VALID USERNAME}    ${EMPTY}
Empty Both            ${EMPTY}             ${EMPTY}

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Login
