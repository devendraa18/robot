*** Setting ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot
Resource    ${CURDIR}${/}/CheckFeasibility.robot




*** Variable ***
${postal_code_unit_number_header}    //div[@data-qa='feasibility_view_mode']
${postal_code_unit_number_header_label}    //div[@data-qa='feasibility_view_mode']/h2
${postal_code_label}    //label[@data-qa='postal_code_label']
${postal_code_inputfield}    //input[@data-qa='postal_code']
${unit_number_label}    //label[@data-qa='unit_number_label']
${unit_number_inputfield}    //input[@data-qa='unit_number']

#**********************Schedule2 Non Residential connection variables*************************************************
${installation_option_label}    //label[@data-qa='installation_option_label']
${installation_option_label_value}    Installation Option
${installation_option_dropdown_field}    //select[@data-qa='installation_option']
${check_feasibility_button}    //form[@id='feasibilityForm']//button[@data-qa='submit_btn']
${check_feasibility_button_label_value}    Check Feasibility
${string_portal_code}	fdsf@@$&SDS
${number_postal_code}	45656456477


*** Keyword ***

Verify 'Postal Code and Unit Number' section
    Verify 'Postal Code and Unit Number' section label and is collapsable
    Verify 'Postal Code' lable and field is read only
    Verify 'Unit Number' lable and field is read only
    Verify 'Installation Option' label and is read only
 

Validate NonResi Feasibility Check section
    Verify 'Postal Code and Unit Number' section label and is collapsable
    CheckFeasibility.Verify Submit disabled
    CheckFeasibility.Verify 'Postal Code' label
    CheckFeasibility.Verify 'Postal Code' can only be digits and exactly six digits    
    CheckFeasibility.Verify 'Postal Code' is mandatory    
    CheckFeasibility.Verify 'Postal Code' is enabled
    CheckFeasibility.Verify 'Postal Code' is empty
    CheckFeasibility.Verify 'Unit Number' can only be digits and '-', atleast 1 digit and 1 '-', no 2 adjacent '-', cannot start with or end with '-'
    CheckFeasibility.Verify 'Unit Number' label
    CheckFeasibility.Verify 'Unit Number' is mandatory
    CheckFeasibility.Verify 'Unit Number' is enabled
    CheckFeasibility.Verify 'Unit Number' is empty
    Verify 'Installation Option' label
    Verify 'Installation Option' is mandatory
    Verify 'Installation Option' is dropdown
    Verify 'Installation Option' is enabled
    Verify 'Installation Option' by default selection   

 
 
Verify 'Postal Code and Unit Number' section label and is collapsable
    Verify 'Postal Code and Unit Number' section label
    Verify 'Postal Code and Unit Number' section is collapsable
    
    
Verify 'Postal Code' lable and field is read only
    Verify 'Postal Code' field lable
    Verify 'Postal Code' field is read only
    
    
Verify 'Unit Number' lable and field is read only
    Verify 'Unit Number' lable
    Verify 'Unit Number' field is read only


Verify 'Installation Option' label and is read only
    Verify 'Installation Option' lable
    Verify 'Installation Option' field is read only
 

Verify 'Installation Option' lable
    Common.Verify field label    ${installation_option_label}    Installation Option
    
Verify 'Installation Option' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${installation_option_dropdown_field}    123

    
Check Non Resi Feasibility
    [Arguments]    ${postal_code}    ${unit_number} 
    CheckFeasibility.Verify 'Check Feasibility' button label
    CheckFeasibility.Non Resi Perform Check Feasibility    ${postal_code}    ${unit_number}


Verify 'Postal Code and Unit Number' section label
    Element Text Should Be    ${postal_code_unit_number_header_label}    Postal Code and Unit Number
 
    
Verify 'Postal Code and Unit Number' section is collapsable
    Element Should Be Visible    ${postal_code_label} 
    Click Element    ${postal_code_unit_number_header}
    Wait Until Element Is Not Visible    ${postal_code_label} 
    Element Should Not Be Visible    ${postal_code_label} 
    Click Element    ${postal_code_unit_number_header}
    Wait Until Element Is Visible    ${postal_code_label}
    Element Should Be Visible    ${postal_code_label}
    sleep    5s

Verify 'Postal Code' field lable
    sleep    2s
    Element Text Should Be    ${postal_code_label}    Postal Code
    #Common.Verify field label    ${postal_code_label}    ${POSTAL_CODE_LABEL}
    
Verify 'Postal Code' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${postal_code_inputfield}    123        

Verify 'Unit Number' lable
    #Element Text Should Be    ${unit_number_label}    Unit Number
    Common.Verify field label    ${unit_number_label}    Unit Number
    
Verify 'Unit Number' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${unit_number_inputfield}    123


# Verify 'Check Feasibility' button label    
    # Element Text Should Be    ${check_feasibility_button}    ${check_feasibility_button_label_value}    
    
# Verify Submit disabled
    # Element Should Be Disabled    ${check_feasibility_button}
    
Verify 'Postal Code' label
    Wait Until Page Contains Element    ${postal_code_label} 
    #Element Text Should Be    ${postal_code_label}     ${postal_code_label_value}
    Common.Verify field label    ${postal_code_label}    ${postal_code_label_value}
    
Verify 'Postal Code' can only be digits and exactly six digits
    #Log    TODO: pending regex validation with data combinations
	Input Text    ${postal_code_field}    ${string_portal_code}
	${fetched_postal_value}=    Get Value    ${postal_code_field}		
	Should Not Be Equal As Strings	  ${fetched_postal_value}   ${string_portal_code}
	Input Text	${postal_code_field}    ${number_postal_code}
	${captured_postal_value}=    Get Value   ${postal_code_field}
	${field_text_length}=    Get Length    ${captured_postal_value}
	Should Be True	 ${field_text_length}==6
	Clear Element Text    ${postal_code_field}    #${field_text_length}	
   
    
Verify 'Postal Code' is mandatory
    #Element Should Contain    ${postal_code_label}    *
    Common.Verify field is mandatory    ${postal_code_label}
    
Verify 'Postal Code' is enabled
    Element Should Be Enabled    ${postal_code_field}
    
Verify 'Postal Code' is empty
    Textfield Value Should Be    ${postal_code_field}    ${empty}
    
Verify 'Unit Number' label
    Element Should Be Visible    ${unit_number_label} 
    #Element Text Should Be    ${unit_number_label}     ${unit_number_label_value}
    Common.Verify field label    ${unit_number_label}    ${unit_number_label_value}
 
Verify 'Unit Number' can only be digits and '-', atleast 1 digit and 1 '-', no 2 adjacent '-', cannot start with or end with '-'
    Log    TODO: pending regex validation with data combinations
    
Verify 'Unit Number' is mandatory
    #Element Should Contain    ${unit_number_label}    *
    Common.Verify field is mandatory    ${unit_number_label}
    
Verify 'Unit Number' is enabled
    Element Should Be Enabled    ${unit_number_field}
    
Verify 'Unit Number' is empty
    Textfield Value Should Be    ${unit_number_field}    ${empty}
    

Verify 'Installation Option' label
    #Element Text Should Be    ${installation_option_label}    ${installation_option_label_value}  
    Common.Verify field label    ${installation_option_label}    ${installation_option_label_value}  
    
Verify 'Installation Option' is mandatory
    #Element Should Contain    ${installation_option_label}    *
    Common.Verify field is mandatory    ${installation_option_label}

Verify 'Installation Option' is dropdown
    @{installation_option_values}=    Get List Items    ${installation_option_dropdown_field}
    ${list_size}    Get Length    ${installation_option_values}
    Should Be True    ${list_size} > 1

Verify 'Installation Option' is enabled
    Element Should Be Enabled    ${installation_option_dropdown_field}   
     
Verify 'Installation Option' by default selection
    ${installation_selected_option}    Get Selected List Label    ${installation_option_dropdown_field}
    Should Be Equal As Strings    ${installation_selected_option}    In-building wiring to TP (Self Provide)      

    
# Non Resi Perform Check Feasibility
    # [Arguments]    ${postal_code}    ${unit_number}
    # Input Text    ${${postal_code_inputfield}}     ${postal_code}
    # Input Text    ${${postal_code_inputfield}}    ${unit_number}
    # Select From List By Index    ${installation_option_dropdown_field}    1    
    # Click Button    ${check_feasibility_button}

# Check Feasibility
    # [Arguments]    ${postal_code}    ${unit_number} 
    # Non Resi Perform Check Feasibility    ${postal_code}    ${unit_number}