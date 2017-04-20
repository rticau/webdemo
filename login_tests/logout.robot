*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    Anna
    Input Password    test
    Submit Credentials
    Welcome Page Should Be Open
    Click Element     xpath = //*[@id="sl-header"]/div/div[3]/div/div[2]/a
    Location Should Be    ${LOGIN URL}
    [Teardown]    Close Browser
