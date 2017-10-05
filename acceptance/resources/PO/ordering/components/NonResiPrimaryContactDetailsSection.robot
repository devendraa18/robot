*** Setting ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot



*** Variable ***
${primary_contact_details_toggle}    //section/div[@data-qa='authrep_primary_label']
${primary_contact_details_header}    //section/div[@data-qa='authrep_primary_label']/h2
${primary_contact_details_header_label}    Primary Contact Details
${primary_first_name_label}    //form[@id='Primary_form']//label[@data-qa='first_name_label']
${primary_first_name_inputfield}    //form[@id='Primary_form']//input[@data-qa='first_name']
${primary_last_name_label}    //form[@id='Primary_form']//label[@data-qa='last_name_label']
${primary_last_name_inputfield}    //form[@id='Primary_form']//input[@data-qa='last_name']
${primary_company_name_label}    //form[@id='Primary_form']//label[@data-qa='company_name_label']
${primary_company_name_inputfield}    //form[@id='Primary_form']//input[@data-qa='company_name']
${primary_contact_number_label}    //form[@id='Primary_form']//label[@data-qa='contact_number_label']
${primary_contact_number_inputfield}    //form[@id='Primary_form']//input[@data-qa='contact_number']
${primary_alt_contact_number_label}    //form[@id='Primary_form']//label[@data-qa='alt_number_label']
${primary_alt_contact_number_inputfield}    //form[@id='Primary_form']//input[@data-qa='alt_number']
${primary_email_address_label}    //form[@id='Primary_form']//label[@data-qa='email_address_label']
${primary_email_address_inputfield}    //form[@id='Primary_form']//input[@data-qa='email_address']



*** Keyword ***
Verify sch2 'Primary Contact Details' section
	Verify sch2 'Primary Contact Details' section label and is collapsable
	Verify sch2 primary contact 'first name' label, enabled and is mandatory
	Verify sch2 primary contact 'last name' label, enabled and is mandatory
	Verify sch2 primary contact 'company name' label and enabled
	Verify sch2 primary contact 'contact number' label, enabled and is mandatory
	Verify sch2 primary contact 'alternate contact number' label and enabled
	Verify sch2 primary contact 'email address' label and enabled    
    Verify sch2 user is able to Fill primary contact information

Verify sch2 'Primary Contact Details' section label and is collapsable
    Verify sch2 'Primary Contact Details' section label
    Verify sch2 'Primary Contact Details' section is collapsable
    

Verify sch2 'Primary Contact Details' section label
    Element Text Should Be    ${primary_contact_details_header}    ${primary_contact_details_header_label}
    
Verify sch2 'Primary Contact Details' section is collapsable
    Common.Verify section is collapsable    ${primary_first_name_label}     ${primary_contact_details_toggle}       
    
	
Verify sch2 primary contact 'first name' label, enabled and is mandatory
    Verify primary contact sch2 'first name' label
    Verify primary contact sch2 'first name' field is enabled
    Verify primary contact sch2 'first name' field is mandatory


Verify primary contact sch2 'first name' label
    Common.Verify field label    ${primary_first_name_label}    First Name
    
Verify primary contact sch2 'first name' field is enabled
    Element Should Be Enabled    ${primary_first_name_inputfield}

Verify primary contact sch2 'first name' field is mandatory
    Common.Verify field is mandatory    ${primary_first_name_label}
    

Verify sch2 primary contact 'last name' label, enabled and is mandatory
    Verify sch2 primary contact 'last name' label
    Verify sch2 primary contact 'last name' field is enabled
    Verify sch2 primary contact 'last name' field is mandatory
    
Verify sch2 primary contact 'last name' label
    Common.Verify field label    ${primary_last_name_label}    Last Name
    
Verify sch2 primary contact 'last name' field is enabled
    Element Should Be Enabled    ${primary_last_name_inputfield}
    
Verify sch2 primary contact 'last name' field is mandatory
    Common.Verify field is mandatory    ${primary_last_name_label}
    
        

Verify sch2 primary contact 'company name' label and enabled
    Verify sch2 primary contact 'company name' label
    Verify sch2 primary contact 'company name' field is enabled
    
Verify sch2 primary contact 'company name' label
    Common.Verify field label    ${primary_company_name_label}    Company Name
    
Verify sch2 primary contact 'company name' field is enabled
    Element Should Be Enabled    ${primary_company_name_inputfield}    


Verify sch2 primary contact 'contact number' label, enabled and is mandatory
    Verify sch2 primary contact 'contact number' label
    Verify sch2 primary contact 'contact number' field is enabled
    Verify sch2 primary contact 'contact number' field is mandatory

Verify sch2 primary contact 'contact number' label
    Common.Verify field label    ${primary_contact_number_label}    Contact Number
    
Verify sch2 primary contact 'contact number' field is enabled
    Element Should Be Enabled    ${primary_contact_number_inputfield}

Verify sch2 primary contact 'contact number' field is mandatory
    Common.Verify field is mandatory    ${primary_contact_number_label}

Verify sch2 primary contact 'alternate contact number' label and enabled
    Verify sch2 primary contact 'alternate contact number' label
    Verify sch2 primary contact 'alternate contact number' field is enabled

Verify sch2 primary contact 'alternate contact number' label
    Common.Verify field label    ${primary_alt_contact_number_label}    Alternate Contact Number
    
Verify sch2 primary contact 'alternate contact number' field is enabled
    Element Should Be Enabled    ${primary_alt_contact_number_inputfield}

Verify sch2 primary contact 'email address' label and enabled
    Verify sch2 primary contact 'email address' label
    Verify sch2 primary contact 'email address' field is enabled

Verify sch2 primary contact 'email address' label
    Common.Verify field label    ${primary_email_address_label}    Email Address

Verify sch2 primary contact 'email address' field is enabled
    Element Should Be Enabled    ${primary_email_address_inputfield}


Verify sch2 user is able to Fill primary contact information
    [Arguments]    ${first_name}    ${last_name}    ${company_name}    ${contact_number}    ${alt_contact_num}    ${email_address}
    #Select From List By Label    ${auth_repre_salutation_dropdown}    ${salutation}
    Input Text    ${primary_first_name_inputfield}    ${first_name}
    Input Text    ${primary_last_name_inputfield}    ${last_name}
    Input Text    ${primary_company_name_inputfield}    ${company_name}
    Input Text    ${primary_contact_number_inputfield}    ${contact_number}
    Input Text    ${primary_alt_contact_number_inputfield}    ${alt_contact_num}
    Input Text    ${primary_email_address_inputfield}    ${email_address}

#************************************************************** Schedule 2 View Keywords ****************************************************************************

Verify sch2 View 'Primary Contact Details' section
	Verify sch2 'Primary Contact Details' section label and is collapsable
	Verify sch2 View primary 'first name' label and is read only and autopopulated
	Verify sch2 View primary 'last name' label and is read only and autopopulated
	Verify sch2 View primary 'company name' label and is read only and autopopulated
	Verify sch2 View primary 'contact number' label and is read only and autopopulated
	Verify sch2 View primary 'alternate contact number' label and is read only and autopopulated
	Verify sch2 View primary 'email address' label and is read only and autopopulated    


Verify sch2 View primary 'first name' label and is read only and autopopulated
    Verify primary contact sch2 'first name' label
    Verify sch2 View primary 'first name' field is read only
    Verify sch2 View primary 'first name' field is autopopulated
    
Verify sch2 View primary 'first name' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${primary_first_name_inputfield}    123
    
Verify sch2 View primary 'first name' field is autopopulated
    ${first_name_value}=    Get Element Attribute    ${primary_first_name_inputfield}@value
    Should Be Equal As Strings    ${first_name_value}    test

Verify sch2 View primary 'last name' label and is read only and autopopulated
    Verify sch2 primary contact 'last name' label
    Verify sch2 View primary 'last name' field is read only
    Verify sch2 View primary 'last name' field is autopopulated
    
Verify sch2 View primary 'last name' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${primary_last_name_inputfield}    123
    
Verify sch2 View primary 'last name' field is autopopulated
     ${last_name_value}=    Get Element Attribute    ${primary_last_name_inputfield}@value
    Should Be Equal As Strings    ${last_name_value}    test

Verify sch2 View primary 'company name' label and is read only and autopopulated
    Verify sch2 primary contact 'company name' label
    Verify sch2 View primary 'company name' field is read only
    Verify sch2 View primary 'company name' field is autopopulated
    

Verify sch2 View primary 'company name' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${primary_company_name_inputfield}    123
    
Verify sch2 View primary 'company name' field is autopopulated
    ${company_name_value}=    Get Element Attribute    ${primary_company_name_inputfield}@value
    Should Be Equal As Strings    ${company_name_value}    test

Verify sch2 View primary 'contact number' label and is read only and autopopulated
    Verify sch2 primary contact 'contact number' label
    Verify sch2 View primary 'contact number' field is read only
    Verify sch2 View primary 'contact number' field is autopopulated
    
Verify sch2 View primary 'contact number' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${primary_contact_number_inputfield}    123
    
Verify sch2 View primary 'contact number' field is autopopulated
    ${contact_number_value}=    Get Element Attribute    ${primary_contact_number_inputfield}@value
    Should Be Equal As Strings    ${contact_number_value}    121212121

Verify sch2 View primary 'alternate contact number' label and is read only and autopopulated
    Verify sch2 primary contact 'alternate contact number' label
    Verify sch2 View primary 'alternate contact number' field is read only
    Verify sch2 View primary 'alternate contact number' field is autopopulated

Verify sch2 View primary 'alternate contact number' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${primary_alt_contact_number_inputfield}    123
    
Verify sch2 View primary 'alternate contact number' field is autopopulated
    ${alt_contact_number_value}=    Get Element Attribute    ${primary_alt_contact_number_inputfield}@value
    Should Be Equal As Strings    ${alt_contact_number_value}    1212121212

Verify sch2 View primary 'email address' label and is read only and autopopulated
    Verify sch2 primary contact 'email address' label
    Verify sch2 View primary 'email address' field is read only
    Verify sch2 View primary 'email address' field is autopopulated
    
Verify sch2 View primary 'email address' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${primary_email_address_inputfield}    123
    
Verify sch2 View primary 'email address' field is autopopulated
    ${email_address_value}=    Get Element Attribute    ${primary_email_address_inputfield}@value
    Should Be Equal As Strings    ${email_address_value}    test@gmail.com        

