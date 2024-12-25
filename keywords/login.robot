*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Input Username and Password ${username} and ${password}
    Input Text    id:username    ${username}
    Input Text    id:password    ${password}