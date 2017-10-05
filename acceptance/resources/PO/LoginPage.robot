*** Settings ***
Documentation    SWP Login Page
Library    Selenium2Library

*** Variables ***
${user_name}    //input[@data-qa='user_id_textbox']  
${user_name_value}    guest@nlt.com
${password}    //input[@data-qa='login_password_textbox'] 
${password_value}    Admin1
${login_submit}    //button[@data-qa='login_btn']

*** Keywords ***
Login to SWP
    Input Text    xpath=${user_name}    ${user_name_value}
    Input Text    xpath=${password}    ${password_value}
    Click Button    xpath=${login_submit}