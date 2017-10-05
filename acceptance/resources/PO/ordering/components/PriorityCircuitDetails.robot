*** Setting ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot


*** Variable ***
${priority_circuit_header}    //div[@data-qa='priority_circuit_header']
${priority_circuit_header_label}    //div[@data-qa='priority_circuit_header']/h2
${priority_circuit_label}    //div/span[contains(text(),'Priority Circuit')]
${priority_circuit_value_label}    //div[contains(text(),'ADD')]        
${priority_charge_indicator_label}    //label[@data-qa='priority_charge_indicator_label']
${priority_circuit_required_radio}    //input[@data-qa='priorityCircuit_required']      #value=1
${priority_circuit_not_required_radio}    //input[@data-qa='priorityCircuit_not_required']     #value=0

*** Keyword ***
    
Verify 'Priority Circuit Details' section
    Verify 'Priority Circuit Details' section label and is collapsable
    Verify 'Priority Circuit' lable and its value label
    Verify 'Priority Charge Indicator' lable and radios disabled
     
     
     
Verify 'Priority Circuit Details' section label and is collapsable
    Verify 'Priority Circuit Details' label
    Verify 'Priority Circuit Details' collapsable
    
Verify 'Priority Circuit' lable and its value label
    Verify 'Priority Circuit' lable
    Verify 'Priority Circuit' value label
    
    
Verify 'Priority Charge Indicator' lable and radios disabled
    Verify 'Priority Charge Indicator' label
    Verify 'Priority Charge Indicator' required radio is disabled
    Verify 'Priority Charge Indicator' not-required radio is disabled
    
    
Verify 'Priority Circuit Details' label
    Element Text Should Be    ${priority_circuit_header_label}    Priority Circuit Details    
    
Verify 'Priority Circuit Details' collapsable
    Element Should Be Visible    ${priority_circuit_label} 
    Click Element    ${priority_circuit_header}
    Wait Until Element Is Not Visible    ${priority_circuit_label} 
    Element Should Not Be Visible    ${priority_circuit_label} 
    Click Element    ${priority_circuit_header}
    Wait Until Element Is Visible    ${priority_circuit_label}
    Element Should Be Visible    ${priority_circuit_label}     


Verify 'Priority Circuit' lable
    #Element Text Should Be    ${priority_circuit_label}    Priority Circuit
    Common.Verify field label    ${priority_circuit_label}    Priority Circuit
    
Verify 'Priority Circuit' value label
    Element Text Should Be    ${priority_circuit_value_label}    ADD
    
Verify 'Priority Charge Indicator' label
    #Element Text Should Be    ${priority_charge_indicator_label}    Priority Charge Indicator
    Common.Verify field label    ${priority_charge_indicator_label}    Priority Charge Indicator
    
Verify 'Priority Charge Indicator' required radio is disabled
    Element Should Be Disabled    ${priority_circuit_required_radio}
    
Verify 'Priority Charge Indicator' not-required radio is disabled
    Element Should Be Disabled    ${priority_circuit_not_required_radio}
    
    
    