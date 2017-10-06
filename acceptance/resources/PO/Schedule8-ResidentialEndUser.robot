*** Setting ***
Resource    ${CURDIR}${/}/LoginPage.robot
Resource    ${CURDIR}${/}/ordering/components/ARI.robot
Resource    ${CURDIR}${/}/ordering/components/Title.robot
Resource    ${CURDIR}${/}/ordering/components/CheckFeasibility.robot
Resource    ${CURDIR}${/}/ordering/components/ResidentialUserDetails.robot
Resource    ${CURDIR}${/}/ordering/components/RequestedDateAndTimeSlot.robot
Resource    ${CURDIR}${/}/ordering/components/TechnicalDetails.robot
Resource    ${CURDIR}${/}/ordering/components/RequestingLicensee.robot
Resource    ${CURDIR}${/}/ordering/components/CommonHeaderFooterComponents.robot
Resource    ${CURDIR}${/}/ordering/components/OrderConfirmationPage.robot
Resource    ${CURDIR}${/}/ordering/components/ApplicationDetails.robot
Resource    ${CURDIR}${/}/ordering/components/NetworkAttributes.robot
Resource    ${CURDIR}${/}/ordering/components/PostalCodeAndUnitNumber.robot
Resource    ${CURDIR}${/}/ordering/components/PriorityCircuitDetails.robot
Resource    ${CURDIR}${/}/ordering/components/ViewPerformActionSection.robot
Resource    ${CURDIR}${/}/ordering/components/Cancel_ExistingConnectionDetailsSection.robot
Resource    ${CURDIR}${/}/ordering/components/Cancel_CancelConnectionDetailsSection.robot
Resource    ${CURDIR}${/}/ordering/components/TerminateConnectionDetailsSection.robot


*** Variable ***
${ordermanagement_menu_item}    //a[@data-qa='order']
${schedule8_menu_item}    //li[@data-qa='segments']
${schedule8_submenu_item}    //li[@data-qa='Building MDF Room to Residential Premise Connection']
${schedule9_submenu_item}    //li[@data-qa='Building MDF Room to Non-Residential Premise Connection']
${schedule1_header}    //*[@id="app-container"]//h1/span
${view_url}    http://indlin4673:8082/ordermanagement/residentialconnection    #sch1A
#${captured_ori_value}
${ori_output_value}    01-01-07022017-101837-A
${ori_cancel_page_value}    01-01-25072017-13485-A
${activation_date_value}    06/03/2017
${tentative_provision_date}    06/03/2017
${timeline_to_complete}    06/03/2017
${cancel_order_value}    Cancel Order
${terminate_order_value}    Terminate Order
${amend_order_value}    Amend Order
${ari_input_value}    123456


*** Keyword ***

Provide Schedule8-ResidentialEndUser Connection
    [Arguments]    ${residential_home_passed}
    Navigate to Schedule8-ResidentialEndUser Connection provide page
    Title.Validate Title    Request for Building MDF Room to Residential Premise Connection
    ARI.Verify 'ARI' label and it is mandatory, enabled and empty
    CheckFeasibility.Validate Resi Feasibility Check section
    ${postal_code_int}=    Convert To Integer    ${residential_home_passed.postal_code}
    CheckFeasibility.Check Feasibility    ${postal_code_int}    ${residential_home_passed.unit_number}
    ResidentialUserDetails.Verify Coverage Status is    ${residential_home_passed.coverage_status}
    ResidentialUserDetails.Verify 'Building Number' label and is a drop-down, mandatory, not empty and tooltip
    ResidentialUserDetails.Verify 'Building Name' label and is read only and not empty
    ResidentialUserDetails.Verify 'Street Name' label and is read only and not empty
    ResidentialUserDetails.Verify 'Building Type' label and is read only and not empty
    ResidentialUserDetails.Verify 'COPIF Type' label and is read only and not empty
    ResidentialUserDetails.Verify 'Installation Charge' label and is currency formatted, read only and has tooltip icon
    ResidentialUserDetails.Verify 'Service Activation Charge' label and is currency formatted, read only
    ResidentialUserDetails.Verify 'Salutation' label and is mandatory, drop down and no default value selected
	ResidentialUserDetails.Verify 'First Name' label and is mandatory, enabled and empty
	ResidentialUserDetails.Verify 'Last Name' label and is mandatory, enabled and empty
	ResidentialUserDetails.Verify 'Contact Number' label and is mandatory, enabled and empty
	ResidentialUserDetails.Verify 'Alternate Contact Number' label and is enabled and empty
	ResidentialUserDetails.Verify 'Email Address' label and is mandatory, enabled and empty
	#${contact_number_int}=    Convert To Integer    ${residential_home_passed.contact_number}
    ResidentialUserDetails.Fill 'Residential User' info    ${residential_home_passed.salutation}    ${residential_home_passed.first_name}    ${residential_home_passed.last_name}    ${residential_home_passed.contact_number}    ${residential_home_passed.alt_contact_num}    ${residential_home_passed.email_address}
    ResidentialUserDetails.Fill 'Application Reference Identifier' inputbox    ${residential_home_passed.ari_value}
    Validate Requested Date & Time Slot
    Validate Technical Details
    Validate Requesting Licensee
    
    
Provide Schedule8-ResidentialEndUser Connection order submit
    [Arguments]    ${residential_home_passed}
    Navigate to Schedule1-ResidentialEndUser Connection provide page
    ${postal_code_int}=    Convert To Integer    ${residential_home_passed.postal_code}
    CheckFeasibility.Check Feasibility    ${postal_code_int}    ${residential_home_passed.unit_number}
    sleep    1s
    ResidentialUserDetails.Fill 'Residential User' info    ${residential_home_passed.salutation}    ${residential_home_passed.first_name}    ${residential_home_passed.last_name}    ${residential_home_passed.contact_number}    ${residential_home_passed.alt_contact_num}    ${residential_home_passed.email_address}
    ResidentialUserDetails.Fill 'Application Reference Identifier' inputbox    ${residential_home_passed.ari_value}
    RequestedDateAndTimeSlot.Verify date should populate using calendar icon
    RequestedDateAndTimeSlot.Verify 'Reserve' button is visible, clickable and message
    CommonHeaderFooterComponents.Verify 'Submit Request' button label and click    
    ${captured_ori_value}=    Verify Order confirmation Page
    #Set Test Variable    ${captured_ori_value}
    Log to console    ${captured_ori_value}    
    sleep    1s
    [Return]    ${captured_ori_value}
    
    
#******************************************************** Schedule8 Provide keywords **************************************************************

Navigate to Schedule8-ResidentialEndUser Connection provide page
    Wait Until Element Is Visible    ${ordermanagement_menu_item}
    Click Element     ${ordermanagement_menu_item}
    Wait Until Element Is Visible    ${schedule8_menu_item}
    Mouse Over    ${schedule8_menu_item}
    Wait Until Element Is Visible    ${schedule8_submenu_item}
    Click Element     ${schedule8_submenu_item}
    #Wait Until Element Is Visible    ${schedule1_header}
   
    