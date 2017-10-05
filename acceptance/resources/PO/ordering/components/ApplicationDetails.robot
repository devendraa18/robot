*** Setting ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot



*** Variable ***
${current_status_label}    //div[@data-qa='currentStatus']
${current_status_value}    //div[@data-qa='currentStatus_value']
${application_details_header}    //div[@data-qa='appDetails_header']
${application_details_header_label}    //div[@data-qa='appDetails_header']/h2
${order_request_identifier_label_view}    //label[@data-qa='appDetails_ORI_label']    
${order_request_identifier_value_label}    //input[@id='appDetails_ORI']
${application_reference_identifier_label_view}    //form[@id='newAriForm']//label
${application_reference_identifier_inputfield_view}    //form[@id='newAriForm']//input
${date_of_application_label}    //label[@data-qa='appDetails_DOA_label']
${date_of_application_value_label}    //label[@data-qa='appDetails_DOA_value']/input
${tentative_provision_date_label}    //label[@data-qa='appDetails_TPD_label']
${tentative_provision_date_value_label}    //label[@data-qa='appDetails_TPD_value']/input
${timeline_to_complete_label}    //label[@data-qa='appDetails_RPD_label']
${timeline_to_complete_value_label}    //label[@data-qa='appDetails_RPD_value']/input
${reason_for_rejection_label}    //label[@data-qa='appDetails_ROR_label']
${reason_for_rejection_value_label}    //label[@data-qa='appDetails_ROR_value']/input

# residential end user Amend page 
#Title   Request for Residential End User Connection : Amend
${amend_new_ari_label}    //form[@id='ariForm']//label[@data-qa='ari_header_label']
${amend_new_ari_label_value}    New Application Reference Identifier*
${amend_new_ari_inputfield}    //form[@id='ariForm']//input[@data-qa='ari_input']
${amend_ari_label_value}    Application Reference Identifier*
#${amend_current_status_label}    //div[@data-qa='currentStatus']
#${amend_current_status_label_value}    //div[@data-qa='currentStatus_value']    #Accepted

# Amend application details


*** Keyword ***
Verify 'Application Details' section
    Verify 'Current status' label and its value label    ${value_current_status}
    Verify 'Application Details' section label and is collapsable
    Verify 'Order Request Identifier' lable and its value lable
    Verify 'Application Reference Identifier' lable and field is read only
    Verify 'Date of Application' lable and its value lable
    Verify 'Tentative Provision Date' lable and its value lable
    Verify 'Timeline to Complete' lable and its value lable
    Verify 'Reason for Rejection' lable and its value lable


Verify Amend 'Application details' section
    Verify Amend 'New Application Reference Identifier' label and is mandatory
    Verify user can fill 'New ARI' inputfield
    Verify 'Current status' label and its value label    ${value_current_status}
    Verify 'Application Details' section label and is collapsable
    Verify 'Order Request Identifier' lable and its value lable    ${ORI_OUTPUT_VALUE}
    Verify Amend 'ARI' label and is mandatory and non empty
    Verify 'Date of Application' lable and its value lable
    Verify 'Tentative Provision Date' lable and its value lable
    Verify 'Timeline to Complete' lable and its value lable
    Verify 'Reason for Rejection' lable and its value lable
      
  
Verify 'Current status' label and its value label
    [Arguments]    ${value_current_status}
    Verify 'Current status' label
    Verify 'Current status' value label    ${value_current_status}    

Verify 'Application Details' section label and is collapsable
    Verify 'Application Details' section label
    Verify 'Application Details' is collapsable
    
Verify 'Order Request Identifier' lable and its value lable
    [Arguments]    ${ORI_value}
    Verify 'Order Request Identifier' label on view page
    Verify 'Order Request Identifier' value label    ${ORI_value}
    
Verify 'Application Reference Identifier' lable and field is read only
    Verify 'Application Reference Identifier' label
    Verify 'Application Reference Identifier' feild is read only
    
Verify 'Date of Application' lable and its value lable
    Verify 'Date of Application' lable
    Verify 'Date of Application' value lable
    
Verify 'Tentative Provision Date' lable and its value lable
    Verify 'Tentative Provision Date' lable
    Verify 'Tentative Provision Date' value lable    
    
Verify 'Timeline to Complete' lable and its value lable
    Verify 'Timeline to Complete' lable
    Verify 'Timeline to Complete' value lable    
    
Verify 'Reason for Rejection' lable and its value lable
    Verify 'Reason for Rejection' lable
    Verify 'Reason for Rejection' value lable
    


Verify 'Current status' label
    Element Text Should Be    ${current_status_label}    Current Status
    
    
Verify 'Current status' value label
    [Arguments]    ${value_current_status}
    #Element Text Should Be    ${current_status_value}    ${value_current_status}
    Common.Verify field label    ${current_status_value}    ${value_current_status}
    
Verify 'Application Details' section label
    Element Text Should Be    ${application_details_header_label}    Application Details
        
    
Verify 'Application Details' is collapsable
    Element Should Be Visible    ${order_request_identifier_label_view} 
    Click Element    ${application_details_header}
    Wait Until Element Is Not Visible    ${order_request_identifier_label_view} 
    Element Should Not Be Visible    ${order_request_identifier_label_view} 
    Click Element    ${application_details_header}
    Wait Until Element Is Visible    ${order_request_identifier_label_view}
    Element Should Be Visible    ${order_request_identifier_label_view} 
    

Verify 'Order Request Identifier' label on view page
    #Element Text Should Be    ${order_request_identifier_label_view}    Order Request Identifier
    Common.Verify field label    ${order_request_identifier_label_view}    Order Request Identifier
    

Verify 'Order Request Identifier' value label
    [Arguments]    ${ORI_value}
    ${feched_ori_value}    Get Element Attribute    ${order_request_identifier_value_label}@value
    Should Be Equal As Strings    ${ORI_value}    ${feched_ori_value}


Verify 'Application Reference Identifier' label
    #Element Text Should Be    ${application_reference_identifier_label_view}    Application Reference Identifier
    Common.Verify field label    ${application_reference_identifier_label_view}    Application Reference Identifier
    
Verify 'Application Reference Identifier' feild is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${application_reference_identifier_inputfield_view}    123
    
    
Verify 'Date of Application' lable
    Element Text Should Be    ${date_of_application_label}    Date of Application
    
Verify 'Date of Application' value lable
    [Arguments]    ${date_activation}
    ${fetched_act_date}    Get Element Attribute    ${date_of_application_value_label}@value
    Should Be Equal As Strings    ${date_activation}    ${fetched_act_date}
    
    
Verify 'Tentative Provision Date' lable
    #Element Text Should Be    ${tentative_provision_date_label}    Tentative Provision Date
    Common.Verify field label    ${tentative_provision_date_label}    Tentative Provision Date
    
Verify 'Tentative Provision Date' value lable
    [Arguments]    ${tentative_activation}
    ${fetched_tent_date}    Get Element Attribute    ${tentative_provision_date_value_label}@value
    Should Be Equal As Strings    ${tentative_activation}    ${fetched_tent_date}
    #Element Text Should Be         06/03/2017
    
    
Verify 'Timeline to Complete' lable
    #Element Text Should Be    ${timeline_to_complete_label}    Timeline to Complete
    Common.Verify field label    ${timeline_to_complete_label}    Timeline to Complete
    
    
Verify 'Timeline to Complete' value lable 
    [Arguments]    ${timeline_complete}
    ${fetched_timeline_complete}    Get Element Attribute    ${timeline_to_complete_value_label}@value
    Should Be Equal As Strings    ${timeline_complete}    ${fetched_timeline_complete} 
    #Element Text Should Be    ${timeline_to_complete_value_label}    06/03/2017
    
Verify 'Reason for Rejection' lable
    #Element Text Should Be    ${reason_for_rejection_label}    Reason for Rejection
    Common.Verify field label    ${reason_for_rejection_label}    Reason for Rejection
    
Verify 'Reason for Rejection' value lable
    ${fetched_rejection_reason}    Get Element Attribute    ${reason_for_rejection_value_label}@value
    Should Be Equal As Strings    ${fetched_rejection_reason}    test     
    #Element Text Should Be    ${reason_for_rejection_value_label}    test
    
    
# Keywords for Amend test case
Verify Amend 'New Application Reference Identifier' label and is mandatory
    Verify amend 'New Application Reference Identifier' label
    Verify amend 'New Application Reference Identifier' is mandatory field

Verify Amend 'ARI' label and is mandatory and non empty
    Verify amend 'ARI' label
    Verify Amend 'ARI' field is mandatory
    Verify Amend 'ARI' label field is non empty    

Verify amend 'New Application Reference Identifier' label
    Element Text Should Be    ${amend_new_ari_label}    ${amend_new_ari_label_value}
    
Verify amend 'New Application Reference Identifier' is mandatory field
    #Element Should Contain    ${amend_new_ari_label}    *
    Common.Verify field is mandatory    ${amend_new_ari_label}

Verify amend 'ARI' label
    #Element Text Should Be    ${application_reference_identifier_label_view}    ${amend_ari_label_value}    
    Common.Verify field label    ${application_reference_identifier_label_view}    ${amend_ari_label_value}

Verify Amend 'ARI' field is mandatory
    #Element Should Contain    ${application_reference_identifier_label_view}    *
    Common.Verify field is mandatory    ${application_reference_identifier_label_view}   
    
Verify Amend 'ARI' label field is non empty
    ${amend_ari_value}=    Get Element Attribute    ${application_reference_identifier_inputfield_view}@value
    Should Not Be Equal As Strings    ${amend_ari_value}    ${empty}
 
Verify user can fill 'New ARI' inputfield
    Input Text    ${amend_new_ari_inputfield}    dhfgk45454       
    