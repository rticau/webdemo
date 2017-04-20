*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}            10.181.50.202
${BROWSER}           chrome
${DELAY}             0.5
${VALID USER}        Anna
${VALID PASSWORD}    test
${LOGIN URL}         http://${SERVER}/login
${WELCOME URL}       http://${SERVER}/home
${PAGE_TITLE}        SkyLab X - Customer Documentation
${ERROR MESSAGE1}    User could not be found
${ERROR MESSAGE2}    Invalid login credentials
${SUBMIT BUTTON}     xpath=/html/body/app-root/skylab-authentification/div/form/button

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    ${PAGE_TITLE}

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    passsword    ${password}

Submit Credentials
    # Click Button    login_button
    # Press Key  passsword  \\13
    Click Button  ${SUBMIT BUTTON}

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be       ${PAGE_TITLE}
