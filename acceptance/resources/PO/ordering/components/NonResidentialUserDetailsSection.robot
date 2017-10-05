*** Setting ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot





*** Variable ***
${non_residential_user_details_toggle}    //div[@data-qa='nonresenduser_user_details']
${non_residential_user_details_header_label_value}    Non-Residential User Details
${non_residential_user_details_header_label}    //div[@data-qa='nonresenduser_user_details']/h2
${coverage_status_label}    //label[@data-qa='coverage_status_label']



*** Keyword ***
Verify sch2 'Non Residential User Details' section
    Verify sch2 'Non Residential User Details' section label and is collapsable
    
    
Verify sch2 'Non Residential User Details' section label and is collapsable
    Verify sch2 'Non Residential User Details' section label
    Verify sch2 'Non Residential User Details' section is collapsable
    
    
Verify sch2 'Non Residential User Details' section label
    Common.Verify field label    ${non_residential_user_details_header_label}    ${non_residential_user_details_header_label_value}    

Verify sch2 'Non Residential User Details' section is collapsable
    Common.Verify section is collapsable    ${coverage_status_label}    ${non_residential_user_details_toggle}