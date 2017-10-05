*** Setting ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot


*** Variable ***
${requesting_licensee_section_header}    //div[@data-qa='request_top_label']
${requesting_licensee_section_header_label}    //span[text()='Requesting Licensee']
${requesting_licensee_section_header_label_value}    Requesting Licensee
${requesting_licensee_firstName_label}    //span[@id='in_collapse_mode']/span[1]
${requesting_licensee_firstName_label_value}    Amarjeet
${view_requesting_licensee_firstName_label_value}    Test
${requesting_licensee_contact_label}    //span[@id='in_collapse_mode']/span[2]
${requesting_licensee_contact_label_value}    9881720332
${requesting_licensee_name_label}    //label[@data-qa='licensee_name_label']
${requesting_licensee_name_label_value}    Requesting Licensee Name
${requesting_licensee_name_inputbox}    //input[@data-qa='licensee_name']
${designation_label}    //label[@data-qa='designation_label']
${designation_label_value}    Designation
${designation_inputbox}    //input[@data-qa='designation']
${company_name_label}   //label[@data-qa='company_name_label']
${sch2_company_name_label}    //div[@data-qa='request_top_label']/following::label[@data-qa='company_name_label']
${company_name_label_value}    Company Name
${company_name_inputbox}    //input[@data-qa='company_name']
${sch2_company_name_inputbox}    //div[@data-qa='request_top_label']/following::input[@data-qa='company_name']
${view_contact_number_label}    //div[@id='contact']/label[@data-qa='contact_number_label']
${view_contact_number_label_value}    Contact Number
${contact_number_inputbox}    //div[@id='contact']//input[@data-qa='contact_number']
${fax_number_label}    //label[@data-qa='fax_number_label']
${fax_number_label_value}    Fax Number
${fax_number_inputbox}    //input[@data-qa='fax_number']
${view_email_address_label}    //div[@id='email']//label[@data-qa='email_address_label']
${view_email_address_label_value}    Email Address
${email_address_inputbox}    //div[@id='email']//input[@data-qa='email_address']

#//// Non Resi Requesting Licensee variables





*** Keyword ***
Verify section
    Verify 'Requesting Licensee Name' and 'contact' display by default
	Verify 'Requesting Licensee' section label and collapsable
	Verify 'Requesting Licensee Name' lable and is autopopulated, read only
	Verify 'Designation' label and is autopopulated, read only
	Verify 'Company Name' label and is autopopulated, read only
	Verify 'Contact Number' label and is autopopulated, read only
	Verify 'Fax Number' label and is autopopulated, read only
	Verify 'Email Address' label and is autopopulated, read only
	
	
Verify 'Requesting Licensee' section label and collapsable
    Verify 'Requesting Licensee' label
    Verify 'Requesting Licensee' section is collapsable
    
Verify 'Requesting Licensee Name' and 'contact' display by default
    Verify 'Requesting Licensee First Name' lable
    Verify 'contact' label    

Verify 'Requesting Licensee Name' lable and is autopopulated, read only
    Verify 'Requesting Licensee Name' label
    #Verify 'Requesting Licensee Name' is autopopulated
    Verify 'Requesting Licensee Name' is read only
    
    
Verify 'Requesting Licensee Name' lable and is autopopulated, read only view
    Verify 'Requesting Licensee Name' label
    Verify 'Requesting Licensee Name' is autopopulated view
    Verify 'Requesting Licensee Name' is read only   


Verify 'Requesting Licensee Name' lable and is autopopulated, read only amend
    Verify 'Requesting Licensee Name' label
    Verify 'Requesting Licensee Name' is autopopulated amend
    Verify 'Requesting Licensee Name' is read only    
    
Verify 'Designation' label and is autopopulated, read only
    Verify 'Designation' label
    #Verify 'Designation' is autopopulated
    Verify 'Designation' is read only
    
    
Verify 'Company Name' label and is autopopulated, read only
    Verify 'Company Name' label
    #Verify 'Company Name' is autopopulated
    Verify 'Company Name' is read only
    

Verify sch2 'Company Name' label and is autopopulated, read only
    Verify 'Company Name' label
    #Verify 'Company Name' is autopopulated
    Verify sch2 'Company Name' is read only
    
Verify sch2 'Company Name' is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${sch2_company_name_inputbox}    123
    
Verify 'Contact Number' label and is autopopulated, read only
    Verify 'Contact Number' label
    #Verify 'Contact Number' is autopopulated
    Verify 'Contact Number' is read only
    
    
Verify 'Fax Number' label and is autopopulated, read only
    Verify 'Fax Number' label
    #Verify 'Fax Number' is autopopulated
    Verify 'Fax Number' is read only
    
Verify 'Email Address' label and is autopopulated, read only
    Verify 'Email Address' label
    #Verify 'Email Address' is autopopulated
    Verify 'Email Address' is read only
    
    
    
Verify 'Requesting Licensee' label
    #Element Text Should Be    ${requesting_licensee_section_header_label}    ${requesting_licensee_section_header_label_value}
    Common.Verify field label    ${requesting_licensee_section_header_label}    ${requesting_licensee_section_header_label_value}
    
Verify sch2 View 'Requesting Licensee' section is collapsable
    Element Should Be Visible    ${requesting_licensee_name_label} 
    Click Element    ${requesting_licensee_section_header}
    Wait Until Element Is Not Visible    ${requesting_licensee_name_label}
    Click Element    ${requesting_licensee_section_header}
    Wait Until Element Is Visible    ${requesting_licensee_name_label} 
    Element Should Be Visible    ${requesting_licensee_name_label} 


Verify 'Requesting Licensee' section is collapsable
    Element Should Not Be Visible    ${requesting_licensee_name_label} 
    Click Element    ${requesting_licensee_section_header}
    Wait Until Element Is Visible    ${requesting_licensee_name_label} 
    Element Should Be Visible    ${requesting_licensee_name_label} 

    
    
Verify 'Requesting Licensee First Name' lable
    #Element Text Should Be    ${requesting_licensee_firstName_label}    ${requesting_licensee_firstName_label_value}
    Common.Verify field label    ${requesting_licensee_firstName_label}    ${requesting_licensee_firstName_label_value}
    
Verify 'contact' label
    #Element Text Should Be    ${requesting_licensee_contact_label}    ${requesting_licensee_contact_label_value}
    Common.Verify field label    ${requesting_licensee_contact_label}    ${requesting_licensee_contact_label_value}
    
Verify 'Requesting Licensee Name' label
    #Element Text Should Be    ${requesting_licensee_name_label}    ${requesting_licensee_name_label_value}
    Common.Verify field label    ${requesting_licensee_name_label}    ${requesting_licensee_name_label_value}
    
Verify 'Requesting Licensee Name' is autopopulated
    #${requesting_licensee_name}=    Get Text    ${requesting_licensee_name_inputbox}
    #Log    ${requesting_licensee_name}
    ${requesting_licensee_name}=    Get Element Attribute    ${requesting_licensee_name_inputbox}@value
    Should Be Equal As Strings    ${requesting_licensee_name}    Amarjeet

Verify 'Requesting Licensee Name' is autopopulated view
    #${requesting_licensee_name}=    Get Text    ${requesting_licensee_name_inputbox}
    #Log    ${requesting_licensee_name}
    ${requesting_licensee_name}=    Get Element Attribute    ${requesting_licensee_name_inputbox}@value
    Should Be Equal As Strings    ${requesting_licensee_name}    ${view_requesting_licensee_firstName_label_value}

Verify 'Requesting Licensee Name' is autopopulated amend
    #${requesting_licensee_name}=    Get Text    ${requesting_licensee_name_inputbox}
    #Log    ${requesting_licensee_name}
    ${requesting_licensee_name}=    Get Element Attribute    ${requesting_licensee_name_inputbox}@value
    Should Be Equal As Strings    ${requesting_licensee_name}    ${requesting_licensee_firstName_label_value}


    
Verify 'Requesting Licensee Name' is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${requesting_licensee_name_inputbox}    123
    
Verify 'Designation' label
    Element Text Should Be    ${designation_label}    ${designation_label_value}
    
    
Verify 'Designation' is autopopulated
    ${designation}=    Get Element Attribute    ${designation_inputbox}@value
    Should Be Equal As Strings    ${designation}    Executive Officer

Verify 'Designation' is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${designation_inputbox}    123
    
Verify 'Company Name' label
    #Element Text Should Be    ${company_name_label}    ${company_name_label_value}
    Common.Verify field label    ${company_name_label}    ${company_name_label_value}
    
Verify 'Company Name' is autopopulated
    ${company_name}=    Get Element Attribute    ${company_name_inputbox}@value
    Should Be Equal As Strings    ${company_name}    NLT
    
Verify 'Company Name' is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${company_name_inputbox}    123
    
Verify 'Contact Number' label
    #Element Text Should Be    ${view_contact_number_label}    ${view_contact_number_label_value}
    Common.Verify field label    ${view_contact_number_label}    ${view_contact_number_label_value}
    
Verify 'Contact Number' is autopopulated
    ${contact_number}=    Get Element Attribute    ${contact_number_inputbox}@value
    Should Be Equal As Strings    ${contact_number}    9881720332
    
Verify 'Contact Number' is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${contact_number_inputbox}    123
    

Verify 'Fax Number' label
    #Element Text Should Be    ${fax_number_label}    ${fax_number_label_value}
    Common.Verify field label    ${fax_number_label}    ${fax_number_label_value}
    
Verify 'Fax Number' is autopopulated
    ${fax_number}=    Get Element Attribute    ${fax_number_inputbox}@value
    Should Be Equal As Strings    ${fax_name}    1231934
    
Verify 'Fax Number' is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${fax_number_inputbox}    123
    
    
Verify 'Email Address' label
    #Element Text Should Be    ${view_email_address_label}    ${view_email_address_label_value}
    Common.Verify field label    ${view_email_address_label}    ${view_email_address_label_value}
    
Verify 'Email Address' is autopopulated
    ${email_address}=    Get Element Attribute    ${email_address_inputbox}@value
    Should Be Equal As Strings    ${email_address}    NLTNotifications@amdocs.com
    
Verify 'Email Address' is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${email_address_inputbox}    123