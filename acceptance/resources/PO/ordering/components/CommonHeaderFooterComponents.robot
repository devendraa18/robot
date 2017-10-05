*** Setting ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot


*** Variable ***

${submit_button}    //button[@data-qa='submit_button']
${submit_button_label}    //button[@data-qa='submit_button']/span
${submit_button_label_value}    Submit Request

${connection_order_page_breadcrumb}    //ol[@class='breadcrumb']
${go_back_link_top_right}    //div[@data-qa='top-go-back']/a/span
${go_back_link_bottom_right}    //div[@data-qa='bottom-go-back']/a/span

# Order confirmation page

${top_go_to_dashboard_link}    //div[@class='OrderConfirmation__goToDashboard___2guVN OrderConfirmation__topLink___2_TNL']
${bottom_go_to_dashboard_link}    //div[@class='OrderConfirmation__goToDashboard___2guVN OrderConfirmation__bottomLink___1wIPZ']

# Cancel Order page
${cancel_order_page_title}    //h1/span[contains(text(),'Cancel Connection')]
${cancel_order_page_title_label}    Request for Cancel Connection

#Cancel confirmation modal
${cancel_confirmation_modal_header}    //h4[@data-qa='modal-heading']
${cancel_confirmation_modal_body_msg_label}    Are you sure you want to Cancel this
${terminate_confirmation_modal_body_msg_label}    Are you sure you want to terminate this
${cancel_confirmation_modal_body_msg}    //div[@data-qa='modal-body']
${cancel_confirmation_modal_yes_button}    //button[@data-qa='yes-button']
${cancel_confirmation_modal_no_button}    //button[@data-qa='no-button']

#Amend order confirmation variables
${amend_submit_button}    //button[@data-qa='modify_button']
${amend_submit_button_label}    //button[@data-qa='modify_button']/span
${amend_submit_button_label_value}    Submit Request

*** Keyword ***

#Verify page breadcrumb
    



Verify 'Submit Request' button label and click
    Verify 'Submit Request' button label
    Click on 'Submit Request' button
    sleep    5s


Verify Amend 'Submit Request' button label and click
    Verify Amend 'Submit Request' button label
    Click on Amend 'Submit Request' button
    sleep    5s    

Verify 'Submit Request' button label
    #Element Text Should Be    ${submit_button_label}    ${submit_button_label_value}
    Common.Verify field label    ${submit_button_label}    ${submit_button_label_value}  
    
Click on 'Submit Request' button
    Click Element    ${submit_button}
    sleep    2s

Verify Amend 'Submit Request' button label
    #Element Text Should Be    ${amend_submit_button_label}    ${amend_submit_button_label_value}
    Common.Verify field label    ${amend_submit_button_label}    ${amend_submit_button_label_value}
    
Click on Amend 'Submit Request' button
    Click Element    ${amend_submit_button}
     sleep    2s
    
Verify 'Cancel Order Page' title
    Element Text Should Be    ${cancel_order_page_title}    ${cancel_order_page_title_label}
    

Verify 'Cancellation confirm' modal popup and continue
    Click on 'Submit Request' button
    Verify modal header
    Verify modal confirmation message
    Click Yes and confirm


Verify 'Termination confirm' modal popup and continue
    Click on 'Submit Request' button
    Verify terminate modal header 
    Verify terminate modal confirmation message
    Click Yes and confirm


Verify modal header
    Element Should Contain    ${cancel_confirmation_modal_header}    Cancellation    

Verify terminate modal header
    Element Should Contain    ${cancel_confirmation_modal_header}    Termination
    
    
    
Verify modal confirmation message
    Element Should Contain    ${cancel_confirmation_modal_body_msg}    ${cancel_confirmation_modal_body_msg_label}

Verify terminate modal confirmation message
    Element Should Contain    ${cancel_confirmation_modal_body_msg}    ${terminate_confirmation_modal_body_msg_label}

Click Yes and confirm
    Click Element    ${cancel_confirmation_modal_yes_button}
    sleep    2s