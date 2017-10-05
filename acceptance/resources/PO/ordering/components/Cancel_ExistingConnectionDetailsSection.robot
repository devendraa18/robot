*** Setting ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot




*** Variable ***
${existing_connection_details_toggle}    //div[@data-qa='existing_connection_details_widget']
${existing_connection_details_header_label}    Existing Connection Details
${existing_connection_details_header}    //div[@data-qa='existing_connection_details_widget']
${cancel_order_request_identifier_label}    //label[@data-qa='order_request_identifier_label']
${cancel_order_request_identifier_label_value}    Order Request Identifier
${cancel_order_request_identifier_value_label}    //label[@data-qa='ori_value_label']
${cancel_application_reference_identifier_label}    //label[@data-qa='application_reference_identifier_label']
${cancel_application_reference_identifier_label_value}    Application Reference Identifier
${cancel_application_reference_identifier_value_label}    //label[@data-qa='ari_value_label']

# Terminate existing connection details
${terminate_ari_inputfield_readonly}    //input[@data-qa='ari_value_label']


*** Keyword ***
Verify 'Existing Connection Details' section
    Verify 'Existing Connection Details' section lable and is collapsable
    #Verify 'Order Request Identifier' label and its value -Cancel E    ${ORI_cancel_value}
    #[Arguments]    ${ORI_cancel_value}
    Verify 'Order Request Identifier' label -Cancel E
    Verify 'Order Request Identifier' value label -Cancel E
    Verify 'ARI' label and its value    
  
  
Verify Terminate 'Existing Connection Details' section
    Verify 'Existing Connection Details' section lable and is collapsable
    #Verify 'Order Request Identifier' label and its value -Cancel E    ${ORI_cancel_value}
    #[Arguments]    ${ORI_cancel_value}
    Verify 'Order Request Identifier' label -Cancel E
    Verify 'Order Request Identifier' value label -Cancel E
    Verify 'Application Reference Identifier' label -Cancel
    Verify Terminate 'ARI' field is read only field    
        
    
Verify 'Existing Connection Details' section lable and is collapsable
    Verify 'Existing Connection Details' section lable
    Verify 'Existing Connection Details' section is collapsable
    
    
Verify 'Order Request Identifier' label and its value -Cancel E
    [Arguments]    ${ORI_cancel_value}
    Verify 'Order Request Identifier' label -Cancel E
    Verify 'Order Request Identifier' value label -Cancel E    ${ORI_cancel_value}
        
    
Verify 'ARI' label and its value
    Verify 'Application Reference Identifier' label -Cancel
    Verify 'Application Reference Identifier' value label -Cancel
    
    
    
 Verify 'Existing Connection Details' section lable
     Element Text Should Be    ${existing_connection_details_header}    ${existing_connection_details_header_label}    
 
 Verify 'Existing Connection Details' section is collapsable
    Element Should Be Visible    ${cancel_order_request_identifier_label} 
    Click Element    ${existing_connection_details_toggle}
    Wait Until Element Is Not Visible    ${cancel_order_request_identifier_label}
    Element Should Not Be Visible    ${cancel_order_request_identifier_label} 
    Click Element    ${existing_connection_details_toggle}
    Wait Until Element Is Visible    ${cancel_order_request_identifier_label} 
    Element Should Be Visible    ${cancel_order_request_identifier_label}
    
    
Verify 'Order Request Identifier' label -Cancel E
    #Element Text Should Be    ${cancel_order_request_identifier_label}    ${cancel_order_request_identifier_label_value}
    Common.Verify field label    ${cancel_order_request_identifier_label}    ${cancel_order_request_identifier_label_value}
    
Verify 'Order Request Identifier' value label -Cancel E
    [Arguments]    ${ORI_cancel_value}
    #Element Text Should Be    ${cancel_order_request_identifier_value_label}    ${ORI_cancel_value}        
    Common.Verify field label    ${cancel_order_request_identifier_value_label}    ${ORI_cancel_value}
    
Verify 'Application Reference Identifier' label -Cancel
    #Element Text Should Be    ${cancel_application_reference_identifier_label}    ${cancel_application_reference_identifier_label_value}
    Common.Verify field label    ${cancel_application_reference_identifier_label}    ${cancel_application_reference_identifier_label_value}
    
Verify 'Application Reference Identifier' value label -Cancel
    [Arguments]    ${ARI_value}
    #Element Text Should Be    ${cancel_application_reference_identifier_value_label}    ${ARI_value}  
    Common.Verify field label    ${cancel_application_reference_identifier_value_label}    ${ARI_value}    
    
Verify Terminate 'ARI' field is read only field
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${terminate_ari_inputfield_readonly}    123     