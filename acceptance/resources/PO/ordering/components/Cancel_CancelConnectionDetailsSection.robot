*** Setting ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot




*** Variable ***
${cancel_connection_details_header}    //div[@data-qa='cancel_connection_ari_widget']/h2
${cancel_connection_details_toggle}    //div[@data-qa='cancel_connection_ari_widget']    
${cancel_connection_details_header_label}    Cancel Connection Details
${cancel_ari_label}    //label[@data-qa='ari_header_label']
${cancel_ari_label_value}    Application Reference Identifier*
${cancel_ari_inputfield}    //input[@data-qa='ari_input']
${cancel_add_additional_information_link}    //a[@data-qa='additionalInfo_link']
${ari_input_value}    testerqa123



*** Keyword ***
Verify 'Cancel Connection Details' section
    Verify 'Cancel Connection Details' section label and is collapsable
    Verify 'Application Reference Identifier' label and is mandatory field -Cancel C
    Verify 'Add Additional Information' link is present
    
Input value in 'ARI field'
    Input Text    ${cancel_ari_inputfield}    ${ari_input_value}
    sleep    3s 

Verify 'Cancel Connection Details' section label and is collapsable
    Verify 'Cancel Connection Details' section label
    Verify 'Cancel Connection Details' section is collapsable
    
Verify 'Application Reference Identifier' label and is mandatory field -Cancel C
    Verify 'Application Reference Identifier' label -Cancel C
    Verify 'Application Reference Identifier' field is mandatory -Cancel C
    
    
Verify 'Add Additional Information' link is present
    Element Should Be Visible    ${cancel_add_additional_information_link}
    sleep    1s
    
Verify 'Cancel Connection Details' section label
    Element Text Should Be    ${cancel_connection_details_header}    ${cancel_connection_details_header_label}    
    
    
Verify 'Cancel Connection Details' section is collapsable
    Element Should Be Visible    ${cancel_ari_label} 
    Click Element    ${cancel_connection_details_toggle}
    Wait Until Element Is Not Visible    ${cancel_ari_label}
    Element Should Not Be Visible    ${cancel_ari_label} 
    Click Element    ${cancel_connection_details_toggle}
    Wait Until Element Is Visible    ${cancel_ari_label} 
    Element Should Be Visible    ${cancel_ari_label} 
    
Verify 'Application Reference Identifier' label -Cancel C
    #Element Text Should Be    ${cancel_ari_label}    ${cancel_ari_label_value}
    Common.Verify field label    ${cancel_ari_label}    ${cancel_ari_label_value}
    
Verify 'Application Reference Identifier' field is mandatory -Cancel C
    #Element Should Contain    ${cancel_ari_label}    *
    Common.Verify field is mandatory    ${cancel_ari_label}