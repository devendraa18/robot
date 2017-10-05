*** Settings ***
Library    Selenium2Library
Resource    ${CURDIR}${/}/ResidentialUserDetails.robot
Resource    ${CURDIR}${/}../../../Common.robot

*** Variables ***
${check_feasibility_section_header}    //section/div[@data-qa='feasibility_check']/h2
${check_feasibility_section_header_label}    Feasibility Check
${check_feasibility_section_toggle}    //section/div[@data-qa='feasibility_check']
${check_feasibility_button}    //form[@id='feasibilityForm']//button[@data-qa='submit_btn']
${check_feasibility_button_label_value}    Check Feasibility
${postal_code_label}    //label[@data-qa='postal_code_label']
${postal_code_field}    //input[@data-qa='postal_code']
${postal_code_label_value}    Postal Code
${unit_number_label}    //label[@data-qa='unit_number_label']
${unit_number_field}    //input[@data-qa='unit_number']
${unit_number_label_value}    Unit Number
${installation_option_label}    //label[@data-qa='installation_option_label']
${installation_option_label_value}    Installation Option*
${installation_option_dropdown_field}    //select[@data-qa='installation_option']
${string_portal_code}	fdsf@@$&SDS
${number_postal_code}	45656456477

*** Keywords ***
Validate Resi Feasibility Check section
    Verify 'Feasibility Check' section label
    Verify Feasibility section is collapsable
    Verify 'Check Feasibility' button label
    Verify Submit disabled
    Verify sch1 'Postal Code' label
    Verify sch1 'Postal Code' can only be digits and exactly six digits    
    Verify sch1 'Postal Code' is mandatory    
    Verify sch1 'Postal Code' is enabled
    Verify sch1 'Postal Code' is empty
    Verify sch1 'Unit Number' can only be digits and '-', atleast 1 digit and 1 '-', no 2 adjacent '-', cannot start with or end with '-'
    Verify sch1 'Unit Number' label
    Verify sch1 'Unit Number' is mandatory
    Verify sch1 'Unit Number' is enabled
    Verify sch1 'Unit Number' is empty


# Validate NonResi Feasibility Check section
    # Verify 'Feasibility Check' section label
    # Verify Feasibility section is collapsable
    # Verify 'Check Feasibility' button label
    # Verify Submit disabled
    # Verify 'Postal Code' label
    # Verify 'Postal Code' can only be digits and exactly six digits    
    # Verify 'Postal Code' is mandatory    
    # Verify 'Postal Code' is enabled
    # Verify 'Postal Code' is empty
    # Verify 'Unit Number' can only be digits and '-', atleast 1 digit and 1 '-', no 2 adjacent '-', cannot start with or end with '-'
    # Verify 'Unit Number' label
    # Verify 'Unit Number' is mandatory
    # Verify 'Unit Number' is enabled
    # Verify 'Unit Number' is empty
    # Verify 'Installation Option' label
    # Verify 'Installation Option' is mandatory
    # Verify 'Installation Option' is dropdown
    # Verify 'Installation Option' is enabled
    # Verify 'Installation Option' by default selection   


Check Feasibility
    [Arguments]    ${postal_code}    ${unit_number} 
    Perform Check Feasibility    ${postal_code}    ${unit_number}

Verify 'Feasibility Check' section label
    Element Should Be Visible    ${check_feasibility_section_header}
    Element Text Should Be    ${check_feasibility_section_header}    ${check_feasibility_section_header_label} 
    
Verify Feasibility section is collapsable
    Element Should Be Visible    ${check_feasibility_button} 
    Click Element    ${check_feasibility_section_toggle}
    Wait Until Element Is Not Visible    ${check_feasibility_button} 
    Element Should Not Be Visible    ${check_feasibility_button} 
    Click Element    ${check_feasibility_section_toggle}
    Wait Until Element Is Visible    ${check_feasibility_button}
    Element Should Be Visible    ${check_feasibility_button} 

Verify 'Check Feasibility' button label
    Element Text Should Be    ${check_feasibility_button}    ${check_feasibility_button_label_value}

Verify Submit disabled
    Element Should Be Disabled    ${check_feasibility_button}
    
Verify sch1 'Postal Code' label
    Element Should Be Visible    ${postal_code_label} 
    #Element Text Should Be    ${postal_code_label}     ${postal_code_label_value}
    Common.Verify field label    ${postal_code_label}    ${postal_code_label_value}
    #${label_text}    Get Element Attribute    ${postal_code_label}@textContent
    #Should Be Equal As Strings    ${label_text}    ${postal_code_label_value}         
    
Verify sch1 'Postal Code' can only be digits and exactly six digits
    #Log    TODO: pending regex validation with data combinations
	Input Text    ${postal_code_field}    ${string_portal_code}
	${fetched_postal_value}=    Get Value    ${postal_code_field}		
	Should Not Be Equal As Strings	  ${fetched_postal_value}   ${string_portal_code}
	Input Text	${postal_code_field}    ${number_postal_code}
	${captured_postal_value}=    Get Value   ${postal_code_field}
	${field_text_length}=    Get Length    ${captured_postal_value}
	Should Be True	 ${field_text_length}==6
	Clear Element Text    ${postal_code_field}    #${field_text_length}	
   
    
Verify sch1 'Postal Code' is mandatory
    #Element Should Contain    ${postal_code_label}    *
    Common.Verify field is mandatory    ${postal_code_label}
    
Verify sch1 'Postal Code' is enabled
    Element Should Be Enabled    ${postal_code_field}
    
Verify sch1 'Postal Code' is empty
    Textfield Value Should Be    ${postal_code_field}    ${empty}
    
Verify sch1 'Unit Number' label
    Element Should Be Visible    ${unit_number_label} 
    Common.Verify field label    ${unit_number_label}     ${unit_number_label_value}
 
Verify sch1 'Unit Number' can only be digits and '-', atleast 1 digit and 1 '-', no 2 adjacent '-', cannot start with or end with '-'
    Log    TODO: pending regex validation with data combinations
    
Verify sch1 'Unit Number' is mandatory
    #Element Should Contain    ${unit_number_label}    *
    Common.Verify field is mandatory    ${unit_number_label}
    
Verify sch1 'Unit Number' is enabled
    Element Should Be Enabled    ${unit_number_field}
    
Verify sch1 'Unit Number' is empty
    Textfield Value Should Be    ${unit_number_field}    ${empty}
    

# Verify 'Installation Option' label
    # #Element Text Should Be    ${installation_option_label}    ${installation_option_label_value}  
    # Common.Verify field label    ${installation_option_label}    ${installation_option_label_value}  
    
# Verify 'Installation Option' is mandatory
    # #Element Should Contain    ${installation_option_label}    *
    # Common.Verify field is mandatory    ${installation_option_label}

# Verify 'Installation Option' is dropdown
    # @{installation_option_values}=    Get List Items    ${installation_option_dropdown_field}
    # ${list_size}    Get Length    ${installation_option_values}
    # Should Be True    ${list_size} > 1

# Verify 'Installation Option' is enabled
    # Element Should Be Enabled    ${installation_option_dropdown_field}   
     
# Verify 'Installation Option' by default selection
    # ${installation_selected_option}    Get Selected List Label    ${installation_option_dropdown_field}
    # Should Be Equal As Strings    ${installation_selected_option}    In-building wiring to TP (Self Provide)      
       
Perform Check Feasibility
    [Arguments]    ${postal_code}    ${unit_number}
    Input Text    ${postal_code_field}     ${postal_code}
    Input Text    ${unit_number_field}    ${unit_number}
    Click Button    ${check_feasibility_button}

    
Non Resi Perform Check Feasibility
    [Arguments]    ${postal_code}    ${unit_number}
    Input Text    ${postal_code_field}     ${postal_code}
    Input Text    ${unit_number_field}    ${unit_number}
    Select From List By Index    ${installation_option_dropdown_field}    1    
    Click Button    ${check_feasibility_button}
    sleep    30s
    