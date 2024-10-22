*** Settings ***
Documentation

Library    AppiumLibrary

*** Variables ***
${API_IP}    192.168.127.216


***Keywords ***
Do login
    Input Text       xpath=//*[@resource-id="apiIp"]    ${API_IP}
    Click Element    xpath=//*[@resource-id="signInButton"]