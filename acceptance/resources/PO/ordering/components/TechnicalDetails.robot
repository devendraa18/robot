*** Setting ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot


*** Variable ***
${technical_details_header}    //section/div[@data-qa='techDetailsWidget_top_label']
${technical_details_header_label}    //section/div[@data-qa='techDetailsWidget_top_label']/h2/span
${technical_details_header_label_value}    Technical Details
${technology_label}    //label[@data-qa='technology_label']
${technology_label_value}    Technology*
${technology_label_value_view}    Technology
${technology_field}    //select[@id='technology']
${split_ratio_label}    //label[@data-qa='split_ratio_label']
${split_ratio_label_value}    Split Ratio*
${split_ratio_label_value_view}    Split Ratio
${split_ratio_dropdown}    //select[@id='splitratio']
${redundancy_service_label}    //label[@data-qa='redundancy_label']
${redundancy_service_label_value}    Redundancy Service*
${redundancy_service_label_value_view}    Redundancy Service
${not_required_radio_button_group}    redundancyService  
${required_radio_label}    //input[@data-qa='redundancy_required']/following-sibling::span
${required_radio_label_value}    Required
${required_radio_button}    //input[@data-qa='redundancy_required']
${not_required_radio_label}    //input[@data-qa='redundancy_not_required']/following-sibling::span
${not_required_radio_label_value}    Not Required
${not_required_radio_button}    //input[@data-qa='redundancy_not_required']
${in_case_redundency_unavailable_label}    //label[@data-qa='unavailable_label']
${in_case_redundency_unavailable_label_value}    In case redundancy service is unavailable*
${reject_request_label}    //input[@data-qa='reject']/following-sibling::span
${reject_request_label_value}    Reject request
${reject_request_label_radio}    //input[@data-qa='reject']
${reject_request_label_radio_group}    rejectRequest    
${do_not_reject_request_label}    //input[@data-qa='donot_reject']/following-sibling::span
${do_not_reject_request_label_value}    Do not reject request
${do_not_reject_request_label_radio}    //input[@data-qa='donot_reject']
${add_additional_infomration_link}    //div/a[@data-qa='additionalInfo_link']
${add_additional_infomration_toggle}    //section/div[@data-qa='additionalInfo_header']
${add_additional_infomration_header_label}    //section/div[@data-qa='additionalInfo_header']/h2
${add_additional_infomration_header_label_value}    Add Additional Information
${additional_infomration_label_header}    //div[@data-qa='view_additionalInfo_header']/h2
${additional_infomration_label_toggle}     //div[@data-qa='view_additionalInfo_header']
${additional_infomration_label_header_label}    Additional Information:     
${additional_infomration_label}    //label[@data-qa='additional_info_label']
${additional_infomration_field}    //textarea[@data-qa='additional_info']

#****************************************************** **Sch2 View variables ********************************************************************************************

${contact_term_label}    //label[@data-qa='contract_term_label']
${contact_term_label_value}    Contract Term
${contact_term_dropdown}    //select[@data-qa='contract_term']
${data_center_label}    //label[@data-qa='data_center_yes']
${data_center_label_value}    Data Center
${data_center_yes_radio}    //input[@data-qa='data_center_yes']
${data_center_no_radio}    //input[@data-qa='data_center_no']
${external_data_center_rack_number_label}    //label[@data-qa='rack_number_label']
${external_data_center_rack_number_label_value}    External Data Center Rack Number
${external_data_center_rack_number_inputfield}    //input[@data-qa='rack_number']


*** Keyword ***
Verify section
    Verify the 'Technical Details' section label and is collapsable
	Verify the 'Technology' label and is mandatory and dropdown
	Verify the 'Split Ratio' label and is mandatory and dropdown
	Verify the 'Redundancy Service' label and its mandatory
	Verify the 'Required' label and radio button
	Verify the 'Not Required' label, radio button and is ON by default
	Verify that by selecting 'Required' radio button, 'In case redundancy service is unavailable' display
	Verify the 'Reject request' label, radio button and is ON by default
	Verify the 'Do not reject request' label and radio button
	Verify 'Add Additional Information' link and is clickable
	Verify 'Add Additional Information' section label and is collapsable
	Verify 'Additional Information' label and field


View-Technical Details Section validation
    Verify the 'Technical Details' section label and is collapsable on view page
    Verify 'Technology' label view
    Verify 'Technology' field is read only
    Verify 'Split Ratio' label view
    Verify 'Split Ratio' field is read only
    Verify 'Required' radio button is disabled
    Verify 'Not Required' radio button is disabled
    Verify 'Reject Request' radio button is disabled
    Verify 'Do Not Reject Request' radio button is disabled
    
    

Verify the 'Technical Details' section label and is collapsable
    Verify 'Technical Details' label
    Verify 'Technical Details' section is collapsable
    

Verify the 'Technical Details' section label and is collapsable on view page
    Verify 'Technical Details' label
    Verify View 'Technical Details' section is collapsable

    
    
Verify the 'Technology' label and is mandatory and dropdown
    Verify 'Technology' label
    Verify 'Technology' is mandatory field
    Verify 'Technology' is dropdown
    
    
Verify the 'Split Ratio' label and is mandatory and dropdown
    Verify 'Split Ratio' label
    Verify 'Split Ratio' ia mandatory
    Verify 'Split Ratio' is dropdown
    
Verify the 'Redundancy Service' label and its mandatory
    Verify 'Redundancy Service' label
    Verify 'Redundancy Service' is mandatory
    
Verify the 'Required' label and radio button
    Verify 'Required' label
    Verify 'Required' is radio button
    
Verify the 'Not Required' label, radio button and is ON by default
    Verify 'Not Required' label
    Verify 'Not Required' is radio button
    Verify 'Not Required' is ON by default
    
  
Verify the 'Reject request' label, radio button and is ON by default
    Verify 'Reject request' label
    Verify 'Reject request' is radio button
    Verify 'Reject request' is ON by default
    
Verify the 'Do not reject request' label and radio button
    Verify 'Do not reject request' label
    Verify 'Do not reject request' is radio button
    
Verify 'Add Additional Information' link and is clickable
    Verify 'Add Additional Information' is a link
    Verify 'Add Additional Information' is clickable
    
Verify 'Add Additional Information' section label and is collapsable
    Verify 'Add Additional Information' label
    Verify 'Add Additional Information' is collapsable
    
Verify 'Additional Information' label and field
    Verify 'Additional Information' label
    #Verify 'Additional Information' is input field
    


Verify 'Technical Details' label
    #Element Text Should Be    ${technical_details_header_label}    ${technical_details_header_label_value}
    Common.Verify field label    ${technical_details_header_label}    ${technical_details_header_label_value}
    
Verify 'Technical Details' section is collapsable
    Element Should Not Be Visible    ${technology_label}
    Click Element    ${technical_details_header}
    Wait Until Element Is Visible    ${technology_label} 
    Element Should Be Visible    ${technology_label} 
    #Click Element    ${technical_details_header}
    #Wait Until Element Is Visible    ${technology_label}
    #Element Should Not Be Visible    ${technology_label}
    

Verify View 'Technical Details' section is collapsable
    Element Should Be Visible    ${technology_label}
    Click Element    ${technical_details_header}
    #Click Element    ${technical_details_header}
    Wait Until Element Is Not Visible    ${technology_label}
    Element Should Not Be Visible    ${technology_label}
    Click Element    ${technical_details_header}
    Wait Until Element Is Visible    ${technology_label} 
    Element Should Be Visible    ${technology_label} 
    

    
    
Verify 'Technology' label
    #Element Text Should Be    ${technology_label}    ${technology_label_value}
    Common.Verify field label    ${technology_label}    ${technology_label_value}
 
Verify 'Technology' label view
    #Element Text Should Be    ${technology_label}    ${technology_label_value_view}
    Common.Verify field label    ${technology_label}    ${technology_label_value_view}
   
    
Verify 'Technology' is mandatory field
    #Element Should Contain    ${technology_label}    *
    Common.Verify field is mandatory    ${technology_label}
    
Verify 'Technology' is dropdown
    @{technology_values}=    Get List Items    ${technology_field}
    ${list_size}    Get Length    ${technology_values}
#    Should Be True    ${list_size} > 1


Verify 'Technology' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${technology_field}    123


Verify 'Split Ratio' label
    #Element Text Should Be    ${split_ratio_label}    ${split_ratio_label_value}
    Common.Verify field label    ${split_ratio_label}    ${split_ratio_label_value}

Verify 'Split Ratio' label view
    #Element Text Should Be    ${split_ratio_label}    ${split_ratio_label_value_view}
    Common.Verify field label    ${split_ratio_label}    ${split_ratio_label_value_view}
    
Verify 'Split Ratio' ia mandatory
    #Element Should Contain    ${split_ratio_label}    *
    Common.Verify field is mandatory    ${split_ratio_label}
    
Verify 'Split Ratio' is dropdown
    @{split_ratio_values}=    Get List Items    ${split_ratio_dropdown}
    ${list_size}    Get Length    ${split_ratio_values}
#    Should Be True    ${list_size} > 1
    
Verify 'Split Ratio' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${split_ratio_dropdown}    123

    
Verify 'Redundancy Service' label
    #Element Text Should Be    ${redundancy_service_label}    ${redundancy_service_label_value}
    Common.Verify field label    ${redundancy_service_label}    ${redundancy_service_label_value}

Verify 'Redundancy Service' label view
    #Element Text Should Be    ${redundancy_service_label}    ${redundancy_service_label_value_view}
    Common.Verify field label    ${redundancy_service_label}    ${redundancy_service_label_value_view}
    
Verify 'Redundancy Service' is mandatory
    #Element Should Contain    ${redundancy_service_label}    *
    Common.Verify field is mandatory    ${redundancy_service_label}
    
Verify 'Required' label
    #Element Text Should Be    ${required_radio_label}    ${required_radio_label_value}
    Common.Verify field label    ${required_radio_label}    ${required_radio_label_value}
    
Verify 'Required' is radio button
    Page Should Contain Radio Button    ${required_radio_button}    message=Radio button not found    loglevel=INFO


Verify 'Required' radio button is disabled
    Element Should Be Disabled    ${required_radio_button}
       
Verify 'Not Required' label
    #Element Text Should Be    ${not_required_radio_label}    ${not_required_radio_label_value}
    Common.Verify field label    ${not_required_radio_label}    ${not_required_radio_label_value}
    
Verify 'Not Required' is radio button
    Page Should Contain Radio Button    ${not_required_radio_button}    message=Radio button not found    loglevel=INFO
    
Verify 'Not Required' is ON by default
    Radio Button Should Be Set To    ${not_required_radio_button_group}    0

Verify 'Not Required' radio button is disabled
    Element Should Be Disabled    ${not_required_radio_button}
        
Verify that by selecting 'Required' radio button, 'In case redundancy service is unavailable' display
    Wait Until Element Is Visible    ${required_radio_button}
    Select Radio Button    ${not_required_radio_button_group}    1
    Wait Until Element Is Visible    ${in_case_redundency_unavailable_label}
    Element Should Be Visible    ${in_case_redundency_unavailable_label}
    Element Text Should Be    ${in_case_redundency_unavailable_label}    ${in_case_redundency_unavailable_label_value}
       
  
Verify 'Reject request' label
    #Element Text Should Be    ${reject_request_label}    ${reject_request_label_value}
    Common.Verify field label    ${reject_request_label}    ${reject_request_label_value}
    
Verify 'Reject request' is radio button
    Page Should Contain Radio Button    ${reject_request_label_radio}    message=Radio button not found    loglevel=INFO
    
Verify 'Reject request' is ON by default
    Radio Button Should Be Set To    ${reject_request_label_radio_group}    1
 

Verify 'Reject Request' radio button is disabled
    Element Should Be Disabled    ${reject_request_label_radio}
   
    
Verify 'Do not reject request' label
    #Element Text Should Be    ${do_not_reject_request_label}    ${do_not_reject_request_label_value}
    Common.Verify field label    ${do_not_reject_request_label}    ${do_not_reject_request_label_value}
    
Verify 'Do not reject request' is radio button
    Page Should Contain Radio Button    ${do_not_reject_request_label_radio}    message=Radio button not found    loglevel=INFO
    Select Radio Button    ${not_required_radio_button_group}    0

Verify 'Do Not Reject Request' radio button is disabled
    Element Should Be Disabled    ${do_not_reject_request_label_radio}

    
Verify 'Add Additional Information' is a link
    Page Should Contain Link    ${add_additional_infomration_link}    message=link not found    loglevel=INFO
    
Verify 'Add Additional Information' is clickable
    Click Element    ${add_additional_infomration_link}
    
    
Verify 'Add Additional Information' label
    #Element Text Should Be    ${add_additional_infomration_header_label}    ${add_additional_infomration_header_label_value}
    Common.Verify field label    ${add_additional_infomration_header_label}    ${add_additional_infomration_header_label_value}
    
Verify 'Add Additional Information' is collapsable
    Element Should Be Visible    ${additional_infomration_label} 
    Click Element    ${add_additional_infomration_toggle}
    Wait Until Element Is Not Visible    ${additional_infomration_label} 
    Element Should Not Be Visible    ${additional_infomration_label} 
    Click Element    ${add_additional_infomration_toggle}
    Wait Until Element Is Visible    ${additional_infomration_label}
    Element Should Be Visible    ${additional_infomration_label}
    
Verify 'Additional Information' label
    #Element Text Should Be    ${additional_infomration_label}    ${additional_infomration_label_header_label}
    Common.Verify field label    ${additional_infomration_label}    ${additional_infomration_label_header_label}
    
Verify 'Additional Information' is input field
    Input Text    ${additional_infomration_field}    test
    
Verify 'Additional Information' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${additional_infomration_field}    123    

#*********************************************************** Schedule2 technical details view keywords *****************************************************************
    
Verify sch2 View 'Technical Details' section
    View-Technical Details Section validation
    Verify sch2 View 'contact term' label and is read only
    Verify sch2 View 'data center' label and radio buttons are disabled
    Verify sch2 View 'External Data Center Rack Number' label and is read only and autopopulated
    
Verify sch2 View 'contact term' label and is read only
    Verify sch2 View 'contact term' label
    Verify sch2 View 'contact term' dropdown is read only
    
Verify sch2 View 'contact term' label
    Common.Verify field label    ${contact_term_label}    ${contact_term_label_value}
    
Verify sch2 View 'contact term' dropdown is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${contact_term_dropdown}    123
        
Verify sch2 View 'data center' label and radio buttons are disabled
    Verify sch2 View 'data center' label
    Verify sch2 View 'data center' radio buttons are disabled
    
Verify sch2 View 'data center' label
    Common.Verify field label    ${data_center_label}    ${data_center_label_value}
    
Verify sch2 View 'data center' radio buttons are disabled
    Element Should Be Disabled    ${data_center_yes_radio}
    Element Should Be Disabled    ${data_center_no_radio}

Verify sch2 View 'External Data Center Rack Number' label and is read only and autopopulated
    Verify sch2 View 'External Data Center Rack Number' label
    Verify sch2 View 'External Data Center Rack Number' field is read only
    Verify sch2 View 'External Data Center Rack Number' field is autopopulated    
    
Verify sch2 View 'External Data Center Rack Number' label
    Common.Verify field label    ${external_data_center_rack_number_label}    ${external_data_center_rack_number_label_value}
    
Verify sch2 View 'External Data Center Rack Number' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${external_data_center_rack_number_inputfield}    123
    

Verify sch2 View 'External Data Center Rack Number' field is autopopulated
     ${external_data_value}=    Get Element Attribute    ${external_data_center_rack_number_inputfield}@value
    Should Not Be Equal As Strings    ${external_data_value}    ${empty}
    
Verify sch2 View 'Additional Information' section label and is collapsable
    Verify sch2 View 'Additional Information' section label
    Verify sch2 View 'Additional Information' section is collapsable
    
Verify sch2 View 'Additional Information' section label
    Common.Verify field label    ${additional_infomration_label_header}    Additional Information
    
Verify sch2 View 'Additional Information' section is collapsable    
    Common.Verify section is collapsable    ${additional_infomration_label}    ${additional_infomration_label_toggle}

        
    