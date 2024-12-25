*** Settings ***
Library    SeleniumLibrary
Resource    ../../keywords/login.robot
Test Setup    Open Browser    ${URL}    ${BROWSER}
Test Teardown    Close Browser

*** Variables ***
${URL}    http://the-internet.herokuapp.com/login
${BROWSER}    chrome
${USERNAME_CORRECT}    tomsmith
${PASSWORD_CORRECT}    SuperSecretPassword!
${PASSWORD_INCORRECT}    Password
${USERNAME_INCORRECT}    tomholland
${EXPECTED_TEXT_LOGIN_SUCCESS}    You logged into a secure area!
${EXPECTED_TEXT_PASSWORD_INCORRECT}    Your password is invalid!
${EXPECTED_TEXT_USERNAME_NOT_FOUND}    Your username is invalid!

*** Test Cases ***
Login success
    Input Username and Password ${USERNAME_CORRECT} and ${PASSWORD_CORRECT}
    Click Button    class:radius
    Element Should Contain    id:flash    ${EXPECTED_TEXT_LOGIN_SUCCESS}     
    Element Should Contain    xpath://*[@id="content"]/div/h2    Secure Area
    Element Should Contain    xpath://*[@id="content"]/div/h4    Welcome to the Secure Area. When you are done click logout below.
    Click Element    xpath://i[contains(text(), 'Logout')]
    Element Should Contain    xpath://*[@id="flash"]     You logged out of the secure area!

Login failed - Password incorrect
    Input Username and Password ${USERNAME_CORRECT} and ${PASSWORD_INCORRECT}
    Click Button    class:radius
    Element Should Contain    id:flash     ${EXPECTED_TEXT_PASSWORD_INCORRECT}

Login failed - Username not found
    Input Username and Password ${USERNAME_INCORRECT} and Password!
    Click Button    class:radius
    Element Should Contain    id:flash     ${EXPECTED_TEXT_USERNAME_NOT_FOUND}
  
