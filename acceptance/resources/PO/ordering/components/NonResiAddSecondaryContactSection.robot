*** Setting ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot





*** Variable ***
${add_secondary_contact_toggle}    //div[@data-qa='authrep_secondary_label']
${add_secondary_contact_header_label_value}    Add Secondary Contact
${add_secondary_contact_header_label}    //div[@data-qa='authrep_secondary_label']/h2
${add_secondary_contact_link}    //span[text()='Add Secondary Contact']
${secondary_first_name_label}    //form[@id='Secondary_form']//label[@data-qa='first_name_label']
${secondary_first_name_inputfield}    //form[@id='Secondary_form']//input[@data-qa='first_name']
${secondary_last_name_label}    //form[@id='Secondary_form']//label[@data-qa='last_name_label']
${secondary_last_name_inputfield}    //form[@id='Secondary_form']//input[@data-qa='last_name']
${secondary_company_name_label}    //form[@id='Secondary_form']//label[@data-qa='company_name_label']
${secondary_company_name_inputfield}    //form[@id='Secondary_form']//input[@data-qa='company_name']
${secondary_contact_number_label}    //form[@id='Secondary_form']//label[@data-qa='contact_number_label']
${secondary_contact_number_inputfield}    //form[@id='Secondary_form']//input[@data-qa='contact_number']
${secondary_alt_contact_number_label}    //form[@id='Secondary_form']//label[@data-qa='alt_number_label']
${secondary_alt_contact_number_inputfield}    //form[@id='Secondary_form']//input[@data-qa='alt_number']
${secondary_email_address_label}    //form[@id='Secondary_form']//label[@data-qa='email_address_label']
${secondary_email_address_inputfield}    //form[@id='Secondary_form']//input[@data-qa='email_address']

#*************************************************************************************************************************************************************

${secondary_contact_details_view_toggle}    //div[@data-qa='authrep_secondary_label_view']
${secondary_contact_details_view_header_label_value}    Secondary Contact Details
${secondary_contact_details_view_header_label}    //div[@data-qa='authrep_secondary_label_view']/h2


*** Keyword ***
Verify sch2 'Add Secondary Contact' section
    Verify sch2 'Add Secondary Contact' link is visible and clickable
    Verify sch2 'Add Secondary Contact' section label and is collapsable
	Verify sch2 secondary contact 'first name' label and is enabled
	Verify sch2 secondary contact 'last name' label and is enabled
	Verify sch2 secondary contact 'company name' label and is enabled
	Verify sch2 secondary contact 'contact number' label and is enabled
	Verify sch2 secondary contact 'alternate contact number' label and is enabled
	Verify sch2 secondary contact 'email address' label and is enabled
    Verify sch2 user is able to Fill seconday contact information


Verify sch2 'Add Secondary Contact' link is visible and clickable
    Verify sch2 'Add Secondary Contact' link is visible
    Verify sch2 'Add Secondary Contact' link is clickable
    
    
Verify sch2 'Add Secondary Contact' link is visible
    Element Should Be Visible    ${add_secondary_contact_link}
    
Verify sch2 'Add Secondary Contact' link is clickable    
    Click Element    ${add_secondary_contact_link}
    sleep    2s

Verify sch2 'Add Secondary Contact' section label and is collapsable
    Verify sch2 'Add Secondary Contact' section label
    Verify sch2 'Add Secondary Contact' section is collapsable   
    
Verify sch2 'Add Secondary Contact' section label
    Element Text Should Be    ${add_secondary_contact_header_label}    ${add_secondary_contact_header_label_value}
    
Verify sch2 'Add Secondary Contact' section is collapsable    
    Common.Verify section is collapsable    ${secondary_first_name_label}     ${add_secondary_contact_toggle}
    
Verify sch2 secondary contact 'first name' label and is enabled
    Verify sch2 secondary contact 'first name' label
    Verify sch2 secondary contact 'first name' is enabled

Verify sch2 secondary contact 'first name' label
    Common.Verify field label    ${secondary_first_name_label}    First Name
    
Verify sch2 secondary contact 'first name' is enabled
    Element Should Be Enabled    ${secondary_first_name_inputfield}


Verify sch2 secondary contact 'last name' label and is enabled
    Verify sch2 secondary contact 'last name' label
    Verify sch2 secondary contact 'last name' is enabled

Verify sch2 secondary contact 'last name' label
    Common.Verify field label    ${secondary_last_name_label}    Last Name
    
Verify sch2 secondary contact 'last name' is enabled
    Element Should Be Enabled    ${secondary_last_name_inputfield}


Verify sch2 secondary contact 'company name' label and is enabled
    Verify sch2 secondary contact 'company name' label
    Verify sch2 secondary contact 'company name' is enabled

Verify sch2 secondary contact 'company name' label
    Common.Verify field label    ${secondary_company_name_label}    Company Name
    
Verify sch2 secondary contact 'company name' is enabled
    Element Should Be Enabled    ${secondary_company_name_inputfield}


Verify sch2 secondary contact 'contact number' label and is enabled
    Verify sch2 secondary contact 'contact number' label
    Verify sch2 secondary contact 'contact number' is enabled

Verify sch2 secondary contact 'contact number' label
    Common.Verify field label    ${secondary_contact_number_label}    Contact Number
    
Verify sch2 secondary contact 'contact number' is enabled
    Element Should Be Enabled    ${secondary_contact_number_inputfield}
    

Verify sch2 secondary contact 'alternate contact number' label and is enabled
    Verify sch2 secondary contact 'alternate contact number' label
    Verify sch2 secondary contact 'alternate contact number' is enabled

Verify sch2 secondary contact 'alternate contact number' label
    Common.Verify field label    ${secondary_alt_contact_number_label}    Alternate Contact Number
    
Verify sch2 secondary contact 'alternate contact number' is enabled
    Element Should Be Enabled    ${secondary_alt_contact_number_inputfield}
       

Verify sch2 secondary contact 'email address' label and is enabled
    Verify sch2 secondary contact 'email address' label
    Verify sch2 secondary contact 'email address' is enabled


Verify sch2 secondary contact 'email address' label
    Common.Verify field label    ${secondary_email_address_label}    Email Address
    
Verify sch2 secondary contact 'email address' is enabled
    Element Should Be Enabled    ${secondary_email_address_inputfield}


Verify sch2 user is able to Fill seconday contact information
    [Arguments]    ${first_name}    ${last_name}    ${company_name}    ${contact_number}    ${alt_contact_num}    ${email_address}
    #Select From List By Label    ${auth_repre_salutation_dropdown}    ${salutation}
    Input Text    ${secondary_first_name_inputfield}    ${first_name}
    Input Text    ${secondary_last_name_inputfield}    ${last_name}
    Input Text    ${secondary_company_name_inputfield}    ${company_name}
    Input Text    ${secondary_contact_number_inputfield}    ${contact_number}
    Input Text    ${secondary_alt_contact_number_inputfield}    ${alt_contact_num}
    Input Text    ${secondary_email_address_inputfield}    ${email_address}

#************************************************************ View Secondary contact details section keywords ***************************************************************
    
Verify sch2 View 'Secondary Contact Details' section
	Verify sch2 'Secondary Contact Details' section label and is collapsable
	Verify sch2 View secondary 'first name' label and is read only and autopopulated
	Verify sch2 View secondary 'last name' label and is read only and autopopulated
	Verify sch2 View secondary 'company name' label and is read only and autopopulated
	Verify sch2 View secondary 'contact number' label and is read only and autopopulated
	Verify sch2 View secondary 'alternate contact number' label and is read only and autopopulated
	Verify sch2 View secondary 'email address' label and is read only and autopopulated    


Verify sch2 'Secondary Contact Details' section label and is collapsable
    Verify sch2 'Secondary Contact Details' section label
    Verify sch2 'Secondary Contact Details' section is collapsable   
    
Verify sch2 'Secondary Contact Details' section label
    Element Text Should Be    ${secondary_contact_details_view_header_label}    ${secondary_contact_details_view_header_label_value}
    
Verify sch2 'Secondary Contact Details' section is collapsable    
    Common.Verify section is collapsable    ${secondary_first_name_label}     ${secondary_contact_details_view_toggle}


Verify sch2 View secondary 'first name' label and is read only and autopopulated
    Verify sch2 secondary contact 'first name' label
    Verify sch2 View secondary 'first name' field is read only
    Verify sch2 View secondary 'first name' field is autopopulated
    
Verify sch2 View secondary 'first name' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${secondary_first_name_inputfield}    123
    
Verify sch2 View secondary 'first name' field is autopopulated
    ${first_name_value}=    Get Element Attribute    ${secondary_first_name_inputfield}@value
    Should Be Equal As Strings    ${first_name_value}    test

Verify sch2 View secondary 'last name' label and is read only and autopopulated
    Verify sch2 secondary contact 'last name' label
    Verify sch2 View secondary 'last name' field is read only
    Verify sch2 View secondary 'last name' field is autopopulated
    
Verify sch2 View secondary 'last name' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${secondary_last_name_inputfield}    123
    
Verify sch2 View secondary 'last name' field is autopopulated
     ${last_name_value}=    Get Element Attribute    ${secondary_last_name_inputfield}@value
    Should Be Equal As Strings    ${last_name_value}    test

Verify sch2 View secondary 'company name' label and is read only and autopopulated
    Verify sch2 secondary contact 'company name' label
    Verify sch2 View secondary 'company name' field is read only
    Verify sch2 View secondary 'company name' field is autopopulated
    

Verify sch2 View secondary 'company name' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${secondary_company_name_inputfield}    123
    
Verify sch2 View secondary 'company name' field is autopopulated
    ${company_name_value}=    Get Element Attribute    ${secondary_company_name_inputfield}@value
    Should Be Equal As Strings    ${company_name_value}    test

Verify sch2 View secondary 'contact number' label and is read only and autopopulated
    Verify sch2 secondary contact 'contact number' label
    Verify sch2 View secondary 'contact number' field is read only
    Verify sch2 View secondary 'contact number' field is autopopulated
    
Verify sch2 View secondary 'contact number' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${secondary_contact_number_inputfield}    123
    
Verify sch2 View secondary 'contact number' field is autopopulated
    ${contact_number_value}=    Get Element Attribute    ${secondary_contact_number_inputfield}@value
    Should Be Equal As Strings    ${contact_number_value}    121212121

Verify sch2 View secondary 'alternate contact number' label and is read only and autopopulated
    Verify sch2 secondary contact 'alternate contact number' label
    Verify sch2 View secondary 'alternate contact number' field is read only
    Verify sch2 View secondary 'alternate contact number' field is autopopulated

Verify sch2 View secondary 'alternate contact number' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${secondary_alt_contact_number_inputfield}    123
    
Verify sch2 View secondary 'alternate contact number' field is autopopulated
    ${alt_contact_number_value}=    Get Element Attribute    ${secondary_alt_contact_number_inputfield}@value
    Should Be Equal As Strings    ${alt_contact_number_value}    232322323

Verify sch2 View secondary 'email address' label and is read only and autopopulated
    Verify sch2 secondary contact 'email address' label
    Verify sch2 View secondary 'email address' field is read only
    Verify sch2 View secondary 'email address' field is autopopulated
    
Verify sch2 View secondary 'email address' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${secondary_email_address_inputfield}    123
    
Verify sch2 View secondary 'email address' field is autopopulated
    ${email_address_value}=    Get Element Attribute    ${secondary_email_address_inputfield}@value
    Should Be Equal As Strings    ${email_address_value}    test@gmail.com        

