*** Settings ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot

*** Variables ***
${ari_label}    //label[@data-qa='ari_header_label']
${ari_field}    //input[@data-qa='ari_input']
${ari_label_value}    Application Reference Identifier*


*** Keywords ***
Verify 'ARI' label and it is mandatory, enabled and empty
    Verify label
    Verify mandatory
    Verify enabled
    Verify empty

Verify label
    Element Should Be Visible    xpath=${ari_label}
    Element Text Should Be    xpath=${ari_label}    ${ari_label_value}
    
Verify mandatory
    #Element Should Contain    xpath=${ari_label}    *
    Common.Verify field is mandatory    ${ari_label}
    
Verify enabled
    Element Should Be Enabled    xpath=${ari_field}
    
Verify empty
    Textfield Value Should Be    xpath=${ari_field}    ${empty}