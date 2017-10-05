*** Setting ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot




*** Variable ***
${terminate_connection_details_toggle}    //section/div[@data-qa='terminate_connection_ari_widget']
${terminate_connection_details_header}    //section/div[@data-qa='terminate_connection_ari_widget']/h2
${terminate_connection_details_header_label}    Terminate Connection Details
${terminate_ari_label}    //label[@data-qa='create_ARI_header_label']
${terminate_ari_label_value}    Application Reference Identifier*
${terminate_ari_inputfield}    //input[@data-qa='create_ARI_input']
${terminate_requested_date_label}    //label[@data-qa='activation_date_label']
${terminate_requested_date_label_value}    Requested Date of Termination*
${terminate_requested_date_inputfield}    //input[@id='daypicker_rfa']
${terminate_requested_date_calendar_icon}    //img[@data-qa='calendar_icon']
${terminate_requested_enabled_date}    //div[@aria-label= 'Wed Oct 25 2017']
${terminate_add_additional_information_link}    //a[@data-qa='additionalInfo_link']



*** Keyword ***
Verify 'Terminate Connection Details' section
    Verify 'Terminate Connection Details' section label and is collapsable
    Verify Terminate 'Application Reference Identifier' label and is mandatory
    Verify Terminate 'Requested Date of Termination' label and is mandatory
    Verify user is able to input 'ARI' and can select 'Requested date of termination'
    Verify Terminate 'Add Additional Information' link is present   
    
    
Verify 'Terminate Connection Details' section label and is collapsable
    Verify 'Terminate Connection Details' section label
    Verify 'Terminate Connection Details' section is collapsable    
    
Verify Terminate 'Application Reference Identifier' label and is mandatory
    Verify Terminate 'Application Reference Identifier' label
    Verify Terminate 'Application Reference Identifier' is mandatory
      
    
Verify Terminate 'Requested Date of Termination' label and is mandatory
    Verify Terminate 'Requested Date of Termination' label
    Verify Terminate 'Requested Date of Termination' is mandatory
    
    
Verify user is able to input 'ARI' and can select 'Requested date of termination'
    Verify user is able to input 'ARI' value
    Verify user is able to select 'Requested date of termination'
    
    
Verify Terminate 'Add Additional Information' link is present
    Element Should Be Visible    ${terminate_add_additional_information_link}    
    
    
Verify 'Terminate Connection Details' section label
    Element Text Should Be    ${terminate_connection_details_header}    ${terminate_connection_details_header_label}    

Verify 'Terminate Connection Details' section is collapsable
    Element Should Be Visible    ${terminate_ari_label} 
    Click Element    ${terminate_connection_details_toggle}
    Wait Until Element Is Not Visible    ${terminate_ari_label}
    Element Should Not Be Visible    ${terminate_ari_label} 
    Click Element    ${terminate_connection_details_toggle}
    Wait Until Element Is Visible    ${terminate_ari_label} 
    Element Should Be Visible    ${terminate_ari_label}      
    
    
Verify Terminate 'Application Reference Identifier' label
    #Element Text Should Be    ${terminate_ari_label}    ${terminate_ari_label_value}
    Common.Verify field label    ${terminate_ari_label}    ${terminate_ari_label_value}

Verify Terminate 'Application Reference Identifier' is mandatory
    #Element Should Contain    ${terminate_ari_label}    *
    Common.Verify field is mandatory    ${terminate_ari_label}
    
Verify Terminate 'Requested Date of Termination' label
    #Element Text Should Be    ${terminate_requested_date_label}    ${terminate_requested_date_label_value}
    Common.Verify field label    ${terminate_requested_date_label}    ${terminate_requested_date_label_value}
    
Verify Terminate 'Requested Date of Termination' is mandatory    
    #Element Should Contain    ${terminate_requested_date_label}    *
    Common.Verify field is mandatory    ${terminate_requested_date_label}
    sleep    5s
    
Verify user is able to input 'ARI' value
    #Wait Until Keyword Succeeds    0 min    30s    Verify Terminate 'Requested Date of Termination' label   
    Wait Until Element Is Visible    ${terminate_ari_inputfield}    timeout=10s    error=None     
    Input Text    ${terminate_ari_inputfield}    rtyuwert4534
    
Verify user is able to select 'Requested date of termination'    
    Click Element    ${terminate_requested_date_calendar_icon}
    sleep    2s
    Click Element    ${terminate_requested_enabled_date}
    
    
    