*** Setting ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot



*** Variable ***

${perform_action_header_label}    //div[@class='SubmitButtonGroup__buttonGroup_header___3XIP5']
${perform_action_message_label}    //div[@class='SubmitButtonGroup__buttonGroup_message___2Ey-w']
${perform_action_dropdown}    //select[@data-qa='button_action_value']
${proceed_button}    //button[@data-qa='proceed_button']



*** Keyword ***
Verify 'Perform Action' section
    Verify 'Perform Action' section label
    Verify 'Perform Action' message text
    Verify 'Perform Action' section has a dropdown
    Verify 'Proceed' button label and is clickable
    
    
Verify 'Perform Action' section label
    #Element Text Should Be    ${perform_action_header_label}    Perform Action
    Common.Verify field label    ${perform_action_header_label}    Perform Action
    
Verify 'Perform Action' message text
    Element Text Should Be    ${perform_action_message_label}    Please select an action you wish to perform on this order.

Verify 'Perform Action' section has a dropdown
    @{perform_action_values}=    Get List Items    ${perform_action_dropdown}
    ${list_size}    Get Length    ${perform_action_values}
    Should Be True    ${list_size} > 1

Verify 'Proceed' button label and is clickable
    Element Text Should Be    ${proceed_button}    Proceed
    Click Element    ${proceed_button}
    sleep    5s 
    
Select value in action dropdown
    [Arguments]    ${action_lable}
    Select From List By Label    ${perform_action_dropdown}    ${action_lable}    
           
    
    
    
     
     
     