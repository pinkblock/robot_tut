*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}           displaymanager-staging.dscc.lxk.co
${BROWSER}          PhantomJS
${DELAY}            0
${VALID USERNAME}   signage.installer@lexmarkqa.com
${VALID PASSWORD}   password
${LOGIN URL}        https://${SERVER}/users/auth/perceptive_idp
${USER URL}         https://${SERVER}/users
${ERROR URL}        https://idp-staging.psft.co/auth/users/sign_in

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login

Input Username
    [Arguments]    ${username}
    Input Text    user_email    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    user_password    ${password}

Submit Credentials
    Click Button    commit

User Page Should Be Open
    Location Should Contain    ${USER URL}
    Title Should Be    Display Manager
