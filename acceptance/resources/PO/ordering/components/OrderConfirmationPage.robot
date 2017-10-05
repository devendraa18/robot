*** Setting ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot


*** Variable ***

# provide order confirmation
${order_confirmation_header}    //h1[@data-qa='confirmation_header']
${order_confirmation_message}    The Residential End User Connection request has been submitted successfully.
${cancel_order_confirmation_message1}    //h1[@data-qa='confirmation_header']/div/span[.//text() = 'Cancellation']
${cancel_order_confirmation_message2}    //h1[@data-qa='confirmation_header']/div/span[.//text() = ' request has been submitted successfully.']
${termination_order_confirmation_message1}    //h1[@data-qa='confirmation_header']/div/span[.//text() = 'Termination']
#${cancel_order_confirmation_message}    The Cancellation request has been submitted successfully.
${cancel_order_confirmation_message_contains}    Cancellation
${order_request_identifier_label}    //label[@data-qa='ori_label']
${order_request_identifier_label_value}    Order Request Identifier:
${order_request_identifier_value}    //label[@data-qa='ori_label']/following-sibling::p
${application_reference_identifier_label}    //label[@data-qa='ari_label']
${application_reference_identifier_label_value}    Application Reference Identifier:
${application_reference_identifier_value}    //label[@data-qa='ari_label']/following-sibling::p

# Amend order confirmation
${amend_order_confirmation_message1}    //h1[@data-qa='confirmation_header']/div/span[.//text() = 'The ']
${amend_order_confirmation_message2}    //h1[@data-qa='confirmation_header']/div/span[.//text() = 'Residential End User Connection']
${sch2_amend_order_confirmation_message}    //h1[@data-qa='confirmation_header']/div/span[.//text() = 'Non-Residential End User Connection']
${amend_order_confirmation_message3}    //h1[@data-qa='confirmation_header']/div/span[.//text() = ' : Amend']


# Provide schedule 2 order confirmation variables
${sch2_provide_order_confirmation_message2}    //h1[@data-qa='confirmation_header']/div/span[.//text() = 'Non-Residential End User Connection']




*** Keyword ***
Verify 'Order Confirmation' page
    Verify 'Order Confirmation' header message
    #Verify 'Order Confirmation' breadcrumb
    #Verify 'Go Back Dashboard' links
    Verify 'Order Request Identifier' label
    Verify 'Order Request Identifier' value against input
    Verify 'Application Refrerence Identifier' label
    Verify 'Application Refrerence Identifier' value against input 
    
    

Verify 'Order Confirmation' header message
    ${order_confirm_message}=    Get Text    ${order_confirmation_header}
    Should Be Equal As Strings    ${order_confirm_message}    ${order_confirmation_message}


Verify 'Cancel Order Confirmation' header message
    # ${order_confirm_message}=    Get Text    ${order_confirmation_header}
    # Should Be Equal As Strings    ${order_confirm_message}    ${cancel_order_confirmation_message}
    Element Should Be Visible    ${cancel_order_confirmation_message1}
    Element Should Be Visible    ${cancel_order_confirmation_message2}


Verify 'Termination order confirmation' header message
    Element Should Be Visible    ${termination_order_confirmation_message1}
    Element Should Be Visible    ${cancel_order_confirmation_message2}
    
    
Verify 'Amend order confirmation' header message
    Element Should Be Visible    ${amend_order_confirmation_message1}
    Element Should Be Visible    ${amend_order_confirmation_message2}
    Element Should Be Visible    ${amend_order_confirmation_message3}
    Element Should Be Visible    ${cancel_order_confirmation_message2}


Verify sch2 'Amend order confirmation' header message
    Element Should Be Visible    ${amend_order_confirmation_message1}
    Element Should Be Visible    ${sch2_amend_order_confirmation_message}
    Element Should Be Visible    ${amend_order_confirmation_message3}
    Element Should Be Visible    ${cancel_order_confirmation_message2}
    
    
Verify sch2 'Provide order confirmation' header message
    Element Should Be Visible    ${amend_order_confirmation_message1}
    Element Should Be Visible    ${sch2_provide_order_confirmation_message2}
    Element Should Be Visible    ${cancel_order_confirmation_message2}
     

        
#Verify 'Order Confirmation' breadcrumb
       
    
#Verify 'Go Back Dashboard' links

    
Verify 'Order Request Identifier' label
    #Element Text Should Be    ${order_request_identifier_label}    ${order_request_identifier_label_value}
    Common.Verify field label    ${order_request_identifier_label}    ${order_request_identifier_label_value}
    
Verify 'Order Request Identifier' value against input
    #[Arguments]    ${input_ori_value}
    ${ori_value}=    Get Text    ${order_request_identifier_value}
    Should Not Be Empty    ${ori_value}    ${empty}
    [return]    ${ori_value}        
    
Verify 'Application Refrerence Identifier' label
    #Element Text Should Be    ${application_reference_identifier_label}    ${application_reference_identifier_label_value}
    Common.Verify field label    ${application_reference_identifier_label}    ${application_reference_identifier_label_value}
    
Verify 'Application Refrerence Identifier' value against input
    [Arguments]    ${input_ari_value}
    ${ari_value}=    Get Text    ${application_reference_identifier_value}
    Should Be Equal    ${ari_value}    ${input_ari_value} 
    [return]    ${ari_value}
    