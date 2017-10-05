*** Settings ***
Library    Selenium2Library

*** Variables ***


*** Keywords ***
Validate Title
    [Arguments]    ${title}
    Page Should Contain    ${title}