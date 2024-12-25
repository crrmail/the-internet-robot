*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Login success
    [Documentation]    
    Open Browser    url=http://the-internet.herokuapp.com/login    browser=chrome
    Input Text  id:username    tomsmith
    Input Text    id:password    SuperSecretPassword!
    Click Button    class:radius
    Element Should Contain    id:flash     You logged into a secure area!
    Click Element    xpath://i[contains(text(), 'Logout')]
    Close Browser

Login failed - Password incorrect
    Open Browser    url=http://the-internet.herokuapp.com/login    browser=chrome
    Input Text    username    tomsmith
    Input Text    password    Password
    Click Button    class:radius
    Element Should Contain    id="flash"     Your password is invalid!

Login failed - Username not found
    Open Browser    url=http://the-internet.herokuapp.com/login    browser=chrome
    Input Text    username    tomholland
    Input Text    password    Password!
    Click Button    class:radius
    Element Should Contain    id="flash"     Your username is invalid!
  
