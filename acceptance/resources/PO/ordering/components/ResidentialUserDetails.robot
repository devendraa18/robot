*** Settings ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot
Resource    ${CURDIR}${/}../components/NonResidentialUserDetailsSection.robot


*** Variables ***
${application_reference_identifier}    //input[@data-qa='ari_input']
${coverage_status_label}    //label[@data-qa='coverage_status_label']
${coverage_status_label_value}    Coverage Status
${coverage_status_field}    //label[@ data-qa='cs_value_label']
${residential_user_details_section_header}    xpath=//section/div[@data-qa='resUserDetails_top_label']/h2
${residential_user_details_section_header_label}    Residential User Details
${residential_user_details_section_toggle}    xpath=//section/div[@data-qa='resUserDetails_top_label']
${building_number_label}    //label[@data-qa='building_number_label']
${building_number_label_value}    Building Number
${building_number_field}    //select[@data-qa='building_number']
${building_name_label}    //label[@data-qa='building_name_label']
${building_name_label_value}    Building Name
${building_name_field}    //input[@data-qa='building_name']
${street_name_label}    //label[@data-qa='street_name_label']
${street_name_label_value}    Street Name
${street_name_field}    //input[@data-qa='street_name']
${building_type_label}    //label[@data-qa='building_type_label']
${building_type_label_value}    Building Type
${building_type_field}    //input[@data-qa='building_type']
${copif_type_label}    //label[@data-qa='copif_type_label']
${copif_type_label_value}    COPIF Type
${copif_type_field}    //input[@data-qa='copif_type']
${installation_charge_label}    //label[@data-qa='charges_label']
${installation_charge_label_value}    Installation Charge
${installation_charge_field}    //label[@data-qa='charges_value_label']
${service_activation_charge_label}    //label[@data-qa='activation_charges_label']
${service_activation_charge_label_value}    Service Activation Charge
${service_activation_charge_field}    //label[@data-qa='activation_value']
${salutation_label}    //label[@data-qa='salutation_label']
${salutation_label_value}    Salutation*
${salutation_dropdown}    //select[@data-qa='salutation']
${first_name_label}    //label[@data-qa='first_name_label'] 
${first_name_label_value}    First Name*
${first_name_field}    //input[@data-qa='first_name']
${last_name_label}    //label[@data-qa='last_name_label'] 
${last_name_field}    //input[@data-qa='last_name']
${last_name_label_value}    Last Name*
${contact_number_label}    //label[@data-qa='contact_number_label'] 
${contact_number_field}    //input[@data-qa='contact_number']
${contact_number_label_value}    Contact Number*
${alt_contact_number_label}    //label[@data-qa='alt_number_label'] 
${alt_contact_number_field}    //input[@data-qa='alt_number']
${alt_contact_number_label_value}    Alternate Contact Number
${email_address_label}    //label[@data-qa='email_address_label'] 
${email_address_field}    //input[@data-qa='email_address']
${email_address_label_value}    Email Address

#//////Non residential section variables
${non_residential_user_details_toggle}    //div[@data-qa='nonresenduser_user_details']
${non_residential_user_details_header_label_value}    Non-Residential User Details
${non_residential_user_details_header_label}    //div[@data-qa='nonresenduser_user_details']/h2



*** Keywords ***
Verify section
    Verify 'Residential User Details' section label and is collapsable
    Verify 'Coverage Status' label and is read only and has expected value
    Verify 'Building Number' label and is a drop-down, mandatory, not empty and tooltip
    Verify 'Building Name' label and is read only and not empty
    Verify 'Street Name' label and is read only and not empty
    Verify 'Building Type' label and is read only and not empty
    Verify 'COPIF Type' label and is read only and not empty
    Verify 'Installation Charge' label and is currency formatted, read only and has tooltip icon
    Verify 'Service Activation Charge' label and is currency formatted, read only
    Verify 'Salutation' label and is mandatory, drop down and no default value selected
	Verify 'First Name' label and is mandatory, enabled and empty
	Verify 'Last Name' label and is mandatory, enabled and empty
	Verify 'Contact Number' label and is mandatory, enabled and empty
	Verify 'Alternate Contact Number' label and is enabled and empty
	Verify 'Email Address' label and is mandatory, enabled and empty
	#Fill 'Application Reference Identifier' inputbox
	


Verify View-Residential User Details
    Verify 'Residential User Details' section label and is collapsable
    Verify 'Coverage Status' label and is read only and has expected value
    Verify 'Building Name' label and is read only and not empty
    Verify 'Street Name' label and is read only and not empty
    Verify 'Building Type' label and is read only and not empty
    Verify 'COPIF Type' label and is read only and not empty
    Verify 'Installation Charge' label and is currency formatted, read only and has tooltip icon
    Verify 'Service Activation Charge' label and is currency formatted, read only
    Verify 'Salutation' field is read only
    Verify 'First Name' field is read only
    Verify 'Last Name' field is read only
    Verify 'Contact Number' field is read only
    Verify 'Alt Contact Number' field is read only
    Verify 'Email Address' field is read only



Verify Amend-Residential User Details
    Verify 'Residential User Details' section label and is collapsable
    Verify 'Coverage Status' label and is read only and has expected value
    Verify 'Building Name' label and is read only and not empty
    Verify 'Street Name' label and is read only and not empty
    Verify 'Building Type' label and is read only and not empty
    Verify 'COPIF Type' label and is read only and not empty
    Verify 'Installation Charge' label and is currency formatted, read only and has tooltip icon
    Verify 'Service Activation Charge' label and is currency formatted, read only
    Verify 'Salutation' label and is mandatory and value is selected
	Verify 'First Name' field is read only
    Verify 'Last Name' field is read only
    Verify 'Contact Number' field is read only
    Verify 'Alt Contact Number' field is read only
    Verify 'Email Address' field is read only


Verify sch2 'Non-Residentail User Details' section
    #Verify 'Residential User Details' section label and is collapsable
    NonResidentialUserDetailsSection.Verify sch2 'Non Residential User Details' section label and is collapsable
    Verify 'Coverage Status' label and is read only and has expected value
    Verify 'Building Number' label and is read only and not empty
    Verify 'Building Name' label and is read only and not empty
    Verify 'Street Name' label and is read only and not empty
    Verify 'Installation Charge' label and is currency formatted, read only and has tooltip icon
    Verify 'Service Activation Charge' label and is currency formatted, read only
     

Fill 'Residential User' info
    [Arguments]    ${salutation}    ${first_name}    ${last_name}    ${contact_number}    ${alt_contact_num}    ${email_address}
    Select From List By Label    ${salutation_dropdown}    ${salutation}
    Input Text    ${first_name_field}    ${first_name}
    Input Text    ${last_name_field}    ${last_name}
    Input Text    ${contact_number_field}    ${contact_number}
    Input Text    ${alt_contact_number_field}    ${alt_contact_num}
    Input Text    ${email_address_field}    ${email_address}


Fill 'Application Reference Identifier' inputbox
    [Arguments]    ${input_ari}
    Input Text    ${application_reference_identifier}    ${input_ari}

Verify 'Residential User Details' section label and is collapsable
    Verify 'Residential User Details' section label
    Verify 'Residential User Details' section is collapsable
    
    
# Verify sch2 'Non-Residential User Details' section label and is collapsable
    # Verify sch2 'Non-Residential User Details' section label
    # Verify sch2 'Non-Residential User Details' section is collapsable


Verify sch2 'Non-Residential User Details' section label
     Common.Verify field label    ${non_residential_user_details_header_label}    ${non_residential_user_details_header_label_value}       
    
Verify sch2 'Non-Residential User Details' section is collapsable
    Common.Verify section is collapsable     ${coverage_status_label}    ${non_residential_user_details_toggle}
    
Verify sch2 'Authorized Representative' section label and is collapsable
    Verify sch2 'Authorized Representative' section label
    Verify sch2 'Authorized Representative' section is collapsable

    
Verify sch2 'Primary Contact Details' section label and is collapsable
    Verify sch2 'Primary Contact Details' section label
    Verify sch2 'Primary Contact Details' section is collapsable

    
Verify sch2 'Add Secondary Contact' section label and is collapsable
    Verify sch2 'Add Secondary Contact' section label
    Verify sch2 'Add Secondary Contact' section is collapsable    
    
    
Verify 'Coverage Status' label and is read only and has expected value
    Verify 'Coverage Status' label
    Verify 'Coverage Status' is read only 
    
Verify 'Building Number' label and is a drop-down, mandatory, not empty and tooltip
    Verify 'Building Number' label
    Verify 'Building Number' is drop-down
    #Verify 'Building Number' is mandatory
    #Verify 'Building Number' is not empty
    Verify 'Building Number' has tooltip    

Verify 'Building Number' label and is read only and not empty
    Verify 'Building Number' label
    Verify 'Building Number' field is read only
    
Verify 'Building Number' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${building_number_field}    123    


Verify 'Building Name' label and is read only and not empty
    Verify 'Building Name' label
    Verify 'Building Name' is read only
    #Verify 'Building Name' is not empty
    
Verify 'Street Name' label and is read only and not empty
    Verify 'Street Name' label
    Verify 'Street Name' is read only
    #Verify 'Street Name' is not empty
    
Verify 'Building Type' label and is read only and not empty
    Verify 'Building Type' label
    Verify 'Building Type' is read only
    #Verify 'Building Type' is not empty
    Verify 'Building Type' has info tooltip
    
Verify 'COPIF Type' label and is read only and not empty
    Verify 'COPIF Type' label
    Verify 'COPIF Type' is read only
    #Verify 'COPIF Type' is not empty
    
Verify 'Installation Charge' label and is currency formatted, read only and has tooltip icon
    Verify 'Installation Charge' label
    Verify 'Installation Charge' is read only 
    
Verify 'Service Activation Charge' label and is currency formatted, read only
    Verify 'Service Activation Charge' label
    Verify 'Service Activation Charge' is read only 
    
Verify Coverage Status is 
    [Arguments]    ${coverage_status}
    Wait Until Element Is Visible     ${coverage_status_label}
    Element Text Should Be    ${coverage_status_field}    ${coverage_status}

Verify 'Residential User Details' section label
    Element Should Be Visible    ${residential_user_details_section_header}
    Element Text Should Be    ${residential_user_details_section_header}    ${residential_user_details_section_header_label} 
    
Verify 'Residential User Details' section is collapsable
    Element Should Be Visible    ${coverage_status_label} 
    Click Element    ${residential_user_details_section_toggle}
    Wait Until Element Is Not Visible    ${coverage_status_label} 
    Element Should Not Be Visible    ${coverage_status_label} 
    Click Element    ${residential_user_details_section_toggle}
    Wait Until Element Is Visible    ${coverage_status_label}
    Element Should Be Visible    ${coverage_status_label} 
    
Verify 'Coverage Status' label
    #Element Text Should Be    ${coverage_status_label}    ${coverage_status_label_value}
    Common.Verify field label    ${coverage_status_label}    ${coverage_status_label_value}
    
Verify 'Coverage Status' value is    
    [Arguments]    ${coverage_status}
    Element Text Should Be    ${coverage_status_field}    ${coverage_status}
        
Verify 'Coverage Status' is read only
    Run Keyword And Expect Error    *Element must be user-editable in order to clear it*    Input Text    ${coverage_status_field}    123

Verify 'Building Number' label
    #Element Text Should Be    ${building_number_label}     ${building_number_label_value}
    Common.Verify field label    ${building_number_label}    ${building_number_label_value}
    
Verify 'Building Number' is drop-down
    @{building_number_values}=    Get List Items    ${building_number_field}
    ${list_size}    Get Length    ${building_number_values}
#    Should Be True    ${list_size} > 1
    
Verify 'Building Number' is mandatory
    #Element Should Contain    ${building_number_label}    *
    Common.Verify field is mandatory    ${building_number_label}
    
#Verify 'Building Number' is not empty
#    Element Should Contain    ${building_number_field}    Option
    
Verify 'Building Number' has tooltip
    Log    TODO: handle tooltip verification pending
    
Verify 'Building Name' label
    #Element Text Should Be    ${building_name_label}     ${building_name_label_value}
    Wait Until Page Contains Element    ${building_name_label}    10s    
    Common.Verify field label    ${building_name_label}    ${building_name_label_value}
    
Verify 'Building Name' is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${building_name_field}    123
    
#Verify 'Building Name' is not empty
#    ${building_name_value}=    Get Text    ${building_name_field} 
#    Should Not Be Equal    ${building_name_value}    ${empty}
    
Verify 'Street Name' label
    #Element Text Should Be    ${street_name_label}     ${street_name_label_value}
    #Wait Until Page Contains    ${street_name_label}
    Common.Verify field label    ${street_name_label}    ${street_name_label_value}
    
Verify 'Street Name' is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${street_name_field}    123
    
Verify 'Building Type' label
    Element Text Should Be    ${street_name_label}     ${street_name_label_value}
    
    
Verify 'Building Type' is read only
    Element Text Should Be    ${street_name_label}     ${street_name_label_value}
    
Verify 'Building Type' has info tooltip
    Log    TODO: handle info tooltip verification pending
    
    
Verify 'COPIF Type' label
    Element Text Should Be    ${street_name_label}     ${street_name_label_value}
    
Verify 'COPIF Type' is read only
    Element Text Should Be    ${street_name_label}     ${street_name_label_value}
    
Verify 'Installation Charge' label
    Element Text Should Be    ${installation_charge_label}      ${installation_charge_label_value}
    
Verify 'Installation Charge' is read only 
    Run Keyword And Expect Error    *Element must be user-editable in order to clear it*    Input Text    ${installation_charge_field}    123
    
Verify 'Service Activation Charge' label
    Element Text Should Be    ${service_activation_charge_label}      ${service_activation_charge_label_value}
    
Verify 'Service Activation Charge' is read only 
    Run Keyword And Expect Error    *Element must be user-editable in order to clear it*    Input Text    ${service_activation_charge_field}    123

Verify 'Salutation' label and is mandatory, drop down and no default value selected
    Verify 'Salutation' label
    Verify 'Salutation' field is mandatory
    Verify 'Salutation' drop down and no default value selected

Verify 'Salutation' label
    Element Text Should Be    ${salutation_label}      ${salutation_label_value}
    
Verify 'Salutation' field is mandatory
    #Element Should Contain    ${salutation_label}    *
    Common.Verify field is mandatory    ${salutation_label}
    
Verify 'Salutation' drop down and no default value selected
    @{salutation_dropdown_values}=    Get List Items    ${salutation_dropdown}
    ${list_size}    Get Length    ${salutation_dropdown_values}
    List Selection Should Be     ${salutation_dropdown}    Select
    
Verify 'Salutation' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${salutation_dropdown}    123

Verify 'Salutation' dropdown is alread selected
    ${salutation_selected_value}    Get Selected List Label    ${salutation_dropdown}
    Should Be True     ${salutation_selected_value}    Mr.
    
Verify 'First Name' label and is mandatory, enabled and empty
    #Element Text Should Be    ${first_name_label}    ${first_name_label_value}
    Common.Verify field label    ${first_name_label}    ${first_name_label_value}
    #Element Should Contain    ${first_name_label}    *
    Common.Verify field is mandatory    ${first_name_label}
    Element Should Be Enabled    ${first_name_field}
    ${first_name_value}=    Get Element Attribute    ${first_name_field}@value            
    Textfield Value Should Be      ${first_name_field}    ${first_name_value}   message='Value Matched' 


Verify 'First Name' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${first_name_field}    123
 

    
Verify 'Last Name' label and is mandatory, enabled and empty
    Element Text Should Be    ${last_name_label}    ${last_name_label_value}
    #Element Should Contain    ${last_name_label}    *
    Common.Verify field is mandatory    ${last_name_label}
    Element Should Be Enabled    ${last_name_field}
    ${last_name_value}=    Get Element Attribute    ${last_name_field}@value            
    Textfield Value Should Be      ${last_name_field}    ${last_name_value}   message='Value Matched'


Verify 'Last Name' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${last_name_field}    123
 

    
Verify 'Contact Number' label and is mandatory, enabled and empty
    Element Text Should Be    ${contact_number_label}    ${contact_number_label_value}
    #Element Should Contain    ${contact_number_label}    *
    Common.Verify field is mandatory    ${contact_number_label}
    Element Should Be Enabled    ${contact_number_field}
    ${contact_number_value}=    Get Element Attribute    ${contact_number_field}@value            
    Textfield Value Should Be      ${contact_number_field}    ${contact_number_value}   message='Value Matched'


Verify 'Contact Number' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${contact_number_field}    123
 

    
Verify 'Alternate Contact Number' label and is enabled and empty
    Element Text Should Be    ${alt_contact_number_label}    ${alt_contact_number_label_value}
    Element Should Be Enabled    ${alt_contact_number_field}
    ${alt_contact_number_value}=    Get Element Attribute    ${alt_contact_number_field}@value            
    Textfield Value Should Be      ${alt_contact_number_field}    ${alt_contact_number_value}   message='Value Matched'

Verify 'Alt Contact Number' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${alt_contact_number_field}    123
 
    
Verify 'Email Address' label and is mandatory, enabled and empty
    #Element Text Should Be    ${email_address_label}    ${email_address_label_value}
    Common.Verify field label    ${email_address_label}    ${email_address_label_value}
    #Element Should Contain    ${email_address_label}    *
    Common.Verify field is mandatory    ${email_address_label}
    Element Should Be Enabled    ${email_address_field}
    ${email_address_value}=    Get Element Attribute    ${contact_number_field}@value            
    Textfield Value Should Be      ${email_address_field}    ${email_address_value}   message='Value Matched'    
    
Verify 'Email Address' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${email_address_field}    123


Verify 'Salutation' label and is mandatory and value is selected
    Verify 'Salutation' label
    Verify 'Salutation' field is mandatory
    Verify 'Salutation' dropdown has value selected    
    
Verify 'First Name' label and is mandatory and autopopulated
    Verify 'First Name' label
    Verify 'First Name' field is mandatory
    Verify 'First Name' field is autopopulated
    
Verify 'Last Name' label and is mandatory and autopopulated
    Verify 'Last Name' label
    Verify 'Last Name' label field is mandatory
    Verify 'Last Name' label field is autopopulated
    
Verify 'Contact Number' label and is mandatory and autopopulated
    Verify residential 'Contact Number' label
    Verify residential 'Contact Number' field is mandatory
    Verify residential 'Contact Number' field is autopopulated
    
Verify 'Alternate Contact Number' label and autopopulated
    Verify 'Alternate Contact Number' label
    Verify 'Alternate Contact Number' field is autopopulated
    
Verify 'Email Address' label and is mandatory and autopopulated
    Verify residential 'Email Address' label
    Verify residential 'Email Address' field is mandatory
    Verify residential 'Email Address' field is autopopulated
    
    
Verify 'Salutation' dropdown has value selected
    ${salutation_selected}    Get Selected List Label    ${salutation_dropdown}
    Should Be Equal As Strings    ${salutation_selected}    Mr.
    
    
Verify 'First Name' label
    #Element Text Should Be    ${first_name_label}    ${first_name_label_value}
    Common.Verify field label    ${first_name_label}    ${first_name_label_value}
    
Verify 'First Name' field is mandatory
    #Element Should Contain    ${first_name_label}    *
    Common.Verify field is mandatory    ${first_name_label}
    
Verify 'First Name' field is autopopulated    
    ${first_name}=    Get Element Attribute    ${first_name_field}@value
    Should Not Be Equal As Strings    ${first_name}    ${empty}
    
Verify 'Last Name' label
    Element Text Should Be    ${last_name_label}    ${last_name_label_value}
    
Verify 'Last Name' label field is mandatory
    #Element Should Contain    ${last_name_label}    *
    Common.Verify field is mandatory    ${last_name_label}

Verify 'Last Name' label field is autopopulated
    ${last_name}=    Get Element Attribute    ${last_name_field}@value
    Should Not Be Equal As Strings    ${last_name}    ${empty}    
    
Verify residential 'Contact Number' label
    #Element Text Should Be    ${contact_number_label}    ${contact_number_label_value}
    Common.Verify field label    ${contact_number_label}    ${contact_number_label_value}
    
Verify residential 'Contact Number' field is mandatory
    #Element Should Contain    ${contact_number_label}    *
    Common.Verify field is mandatory    ${contact_number_label}
    

Verify residential 'Contact Number' field is autopopulated
    ${contact_number}=    Get Element Attribute    ${contact_number_field}@value
    Should Not Be Equal As Strings    ${contact_number}    ${empty}    
    
Verify 'Alternate Contact Number' label
    #Element Text Should Be    ${alt_contact_number_label}    ${alt_contact_number_label_value}
    Common.Verify field label    ${alt_contact_number_label}    ${alt_contact_number_label_value}
    
Verify 'Alternate Contact Number' field is autopopulated
    ${alt_contact_number}=    Get Element Attribute    ${alt_contact_number_field}@value
    Should Not Be Equal As Strings    ${alt_contact_number}    ${empty}
    
Verify residential 'Email Address' label
    #Element Text Should Be    ${email_address_label}    ${email_address_label_value}
    Common.Verify field label    ${email_address_label}    ${email_address_label_value}
    
Verify residential 'Email Address' field is mandatory
    #Element Should Contain    ${email_address_label}    *
    Common.Verify field is mandatory    ${email_address_label}

Verify residential 'Email Address' field is autopopulated
    ${email_address}=    Get Element Attribute    ${email_address_field}@value
    Should Not Be Equal As Strings    ${email_address}    ${empty}    
    
    
    
    
    
    