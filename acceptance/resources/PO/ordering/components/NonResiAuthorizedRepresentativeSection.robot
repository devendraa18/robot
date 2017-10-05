*** Setting ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot






*** Variable ***
${authorized_representative_toggle}    //div[@data-qa='authrep_label']
${authorized_representative_header_label_value}    Authorized Representative
${authorized_representative_header_label}    //div[@data-qa='authrep_label']/h2
${auth_repre_salutation_label}    //label[@data-qa='salutation_label']
${auth_repre_salutation_label_value}    Salutation
${auth_repre_salutation_dropdown}    //select[@data-qa='salutation']
${auth_repre_first_name_label}    //form[@id='Auth_form']//label[@data-qa='first_name_label']
${auth_repre_first_name_inputfield}    //form[@id='Auth_form']//input[@data-qa='first_name']
${auth_repre_last_name_label}    //form[@id='Auth_form']//label[@data-qa='last_name_label']
${auth_repre_last_name_inputfield}    //form[@id='Auth_form']//input[@data-qa='last_name']
${auth_repre_company_name_label}    //form[@id='Auth_form']//label[@data-qa='company_name_label']
${auth_repre_company_name_inputfield}    //form[@id='Auth_form']//input[@data-qa='company_name']
${auth_repre_contact_number_label}    //form[@id='Auth_form']//label[@data-qa='contact_number_label']
${auth_repre_contact_number_inputfield}    //form[@id='Auth_form']//input[@data-qa='contact_number']
${auth_repre_alt_contact_number_label}    //form[@id='Auth_form']//label[@data-qa='alt_number_label']
${auth_repre_alt_contact_number_inputfield}    //form[@id='Auth_form']//input[@data-qa='alt_number']
${auth_repre_email_address_label}    //form[@id='Auth_form']//label[@data-qa='email_address_label']
${auth_repre_email_address_inputfield}    //form[@id='Auth_form']//input[@data-qa='email_address']



*** Keyword ***
Verify sch2 'Authorized Representative' section
	Verify sch2 'Authorized Representative' section label and is collapsable
	Verify sch2 'salutation' label and is mandatory, and a dropdown
	Verify sch2 'first name' label, enabled and is mandatory
	Verify sch2 'last name' label, enabled and is mandatory
	Verify sch2 'company name' label and enabled
	Verify sch2 'contact number' label, enabled and is mandatory
	Verify sch2 'alternate contact number' label and enabled
	Verify sch2 'email address' label and enabled    
    Verify sch2 user is able to Fill user contact information

Verify sch2 'Authorized Representative' section label and is collapsable
    Verify sch2 'Authorized Representative' section label
    Verify sch2 'Authorized Representative' section is collapsable
    

Verify sch2 'Authorized Representative' section label
    Element Text Should Be    ${authorized_representative_header_label}    ${authorized_representative_header_label_value}
    
Verify sch2 'Authorized Representative' section is collapsable
    Common.Verify section is collapsable    ${auth_repre_first_name_label}     ${authorized_representative_toggle}       
    

Verify sch2 'salutation' label and is mandatory, and a dropdown
    Verify sch2 'salutation' label
    Verify sch2 'salutation' is mandatory
    Verify sch2 'salutation' field label is a dropdown
    
Verify sch2 'salutation' label
    Common.Verify field label    ${auth_repre_salutation_label}    ${auth_repre_salutation_label_value}
    
Verify sch2 'salutation' is mandatory
    Common.Verify field is mandatory    ${auth_repre_salutation_label}
    
Verify sch2 'salutation' field label is a dropdown
    Common.Verify field is drop-down    ${auth_repre_salutation_dropdown}

	
Verify sch2 'first name' label, enabled and is mandatory
    Verify sch2 'first name' label
    Verify sch2 'first name' field is enabled
    Verify sch2 'first name' field is mandatory


Verify sch2 'first name' label
    Common.Verify field label    ${auth_repre_first_name_label}    First Name
    
Verify sch2 'first name' field is enabled
    Element Should Be Enabled    ${auth_repre_first_name_inputfield}

Verify sch2 'first name' field is mandatory
    Common.Verify field is mandatory    ${auth_repre_first_name_label}
    

Verify sch2 'last name' label, enabled and is mandatory
    Verify sch2 'last name' label
    Verify sch2 'last name' field is enabled
    Verify sch2 'last name' field is mandatory
    
Verify sch2 'last name' label
    Common.Verify field label    ${auth_repre_last_name_label}    Last Name
    
Verify sch2 'last name' field is enabled
    Element Should Be Enabled    ${auth_repre_last_name_inputfield}
    
Verify sch2 'last name' field is mandatory
    Common.Verify field is mandatory    ${auth_repre_last_name_label}
           

Verify sch2 'company name' label and enabled
    Verify sch2 'company name' label
    Verify sch2 'company name' field is enabled
    
Verify sch2 'company name' label
    Common.Verify field label    ${auth_repre_company_name_label}    Company Name
    
Verify sch2 'company name' field is enabled
    Element Should Be Enabled    ${auth_repre_company_name_inputfield}    


Verify sch2 'contact number' label, enabled and is mandatory
    Verify sch2 'contact number' label
    Verify sch2 'contact number' field is enabled
    Verify sch2 'contact number' field is mandatory

Verify sch2 'contact number' label
    Common.Verify field label    ${auth_repre_contact_number_label}    Contact Number
    
Verify sch2 'contact number' field is enabled
    Element Should Be Enabled    ${auth_repre_contact_number_inputfield}

Verify sch2 'contact number' field is mandatory
    Common.Verify field is mandatory    ${auth_repre_contact_number_label}

Verify sch2 'alternate contact number' label and enabled
    Verify sch2 'alternate contact number' label
    Verify sch2 'alternate contact number' field is enabled

Verify sch2 'alternate contact number' label
    Common.Verify field label    ${auth_repre_alt_contact_number_label}    Alternate Contact Number
    
Verify sch2 'alternate contact number' field is enabled
    Element Should Be Enabled    ${auth_repre_alt_contact_number_inputfield}

Verify sch2 'email address' label and enabled
    Verify sch2 'email address' label
    Verify sch2 'email address' field is enabled

Verify sch2 'email address' label
    Common.Verify field label    ${auth_repre_email_address_label}    Email Address

Verify sch2 'email address' field is enabled
    Element Should Be Enabled    ${auth_repre_email_address_inputfield}


Verify sch2 user is able to Fill user contact information
    [Arguments]    ${salutation}    ${first_name}    ${last_name}    ${company_name}    ${contact_number}    ${alt_contact_num}    ${email_address}
    Select From List By Label    ${auth_repre_salutation_dropdown}    ${salutation}
    Input Text    ${auth_repre_first_name_inputfield}    ${first_name}
    Input Text    ${auth_repre_last_name_inputfield}    ${last_name}
    Input Text    ${auth_repre_company_name_inputfield}    ${company_name}
    Input Text    ${auth_repre_contact_number_inputfield}    ${contact_number}
    Input Text    ${auth_repre_alt_contact_number_inputfield}    ${alt_contact_num}
    Input Text    ${auth_repre_email_address_inputfield}    ${email_address}

#*************************************************** Shedule 2 View keywords ***********************************************************************
    
Verify sch2 View 'Authorized Representative' section
	Verify sch2 'Authorized Representative' section label and is collapsable
	Verify sch2 View 'salutation' label and is read only and autopopulated
	Verify sch2 View 'first name' label and is read only and autopopulated
	Verify sch2 View 'last name' label and is read only and autopopulated
	Verify sch2 View 'company name' label and is read only and autopopulated
	Verify sch2 View 'contact number' label and is read only and autopopulated
	Verify sch2 View 'alternate contact number' label and is read only and autopopulated
	Verify sch2 View 'email address' label and is read only and autopopulated    


Verify sch2 View 'salutation' label and is read only and autopopulated
    Verify sch2 'salutation' label
    Verify sch2 View 'salutation' is read only
    Verify sch2 View 'salutation' is autopopulated
    
Verify sch2 View 'salutation' is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${auth_repre_salutation_dropdown}    123

Verify sch2 View 'salutation' is autopopulated
    ${salutation_value}=    Get Element Attribute    ${auth_repre_salutation_dropdown}@value
    Should Be Equal As Strings    ${salutation_value}    MR

Verify sch2 View 'first name' label and is read only and autopopulated
    Verify sch2 'first name' label
    Verify sch2 View 'first name' field is read only
    Verify sch2 View 'first name' field is autopopulated
    
Verify sch2 View 'first name' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${auth_repre_first_name_inputfield}    123
    
Verify sch2 View 'first name' field is autopopulated
    ${first_name_value}=    Get Element Attribute    ${auth_repre_first_name_inputfield}@value
    Should Be Equal As Strings    ${first_name_value}    John

Verify sch2 View 'last name' label and is read only and autopopulated
    Verify sch2 'last name' label
    Verify sch2 View 'last name' field is read only
    Verify sch2 View 'last name' field is autopopulated
    
Verify sch2 View 'last name' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${auth_repre_last_name_inputfield}    123
    
Verify sch2 View 'last name' field is autopopulated
     ${last_name_value}=    Get Element Attribute    ${auth_repre_last_name_inputfield}@value
    Should Be Equal As Strings    ${last_name_value}    Smith

Verify sch2 View 'company name' label and is read only and autopopulated
    Verify sch2 'company name' label
    Verify sch2 View 'company name' field is read only
    Verify sch2 View 'company name' field is autopopulated
    

Verify sch2 View 'company name' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${auth_repre_company_name_inputfield}    123
    
Verify sch2 View 'company name' field is autopopulated
    ${company_name_value}=    Get Element Attribute    ${auth_repre_company_name_inputfield}@value
    Should Be Equal As Strings    ${company_name_value}    COMP EU

Verify sch2 View 'contact number' label and is read only and autopopulated
    Verify sch2 'contact number' label
    Verify sch2 View 'contact number' field is read only
    Verify sch2 View 'contact number' field is autopopulated
    
Verify sch2 View 'contact number' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${auth_repre_contact_number_inputfield}    123
    
Verify sch2 View 'contact number' field is autopopulated
    ${contact_number_value}=    Get Element Attribute    ${auth_repre_contact_number_inputfield}@value
    Should Be Equal As Strings    ${contact_number_value}    098765487

Verify sch2 View 'alternate contact number' label and is read only and autopopulated
    Verify sch2 'alternate contact number' label
    Verify sch2 View 'alternate contact number' field is read only
    Verify sch2 View 'alternate contact number' field is autopopulated

Verify sch2 View 'alternate contact number' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${auth_repre_alt_contact_number_inputfield}    123
    
Verify sch2 View 'alternate contact number' field is autopopulated
    ${alt_contact_number_value}=    Get Element Attribute    ${auth_repre_alt_contact_number_inputfield}@value
    Should Be Equal As Strings    ${alt_contact_number_value}    54376785

Verify sch2 View 'email address' label and is read only and autopopulated
    Verify sch2 'email address' label
    Verify sch2 View 'email address' field is read only
    Verify sch2 View 'email address' field is autopopulated
    
Verify sch2 View 'email address' field is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${auth_repre_email_address_inputfield}    123
    
Verify sch2 View 'email address' field is autopopulated
    ${email_address_value}=    Get Element Attribute    ${auth_repre_email_address_inputfield}@value
    Should Be Equal As Strings    ${email_address_value}    Test@def.com        




