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


*** Variables ***
${ordermanagement_menu_item}    //a[@data-qa='order']
${schedule1_menu_item}    //li[@data-qa='Residential End User Connection']
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



*** Keywords ***
Provide Schedule1-ResidentialEndUser Connection
    [Arguments]    ${residential_home_passed}
    Navigate to Schedule1-ResidentialEndUser Connection provide page
    Title.Validate Title    Request for Residential End User Connection
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
    

Provide Schedule1-ResidentialEndUser Connection order submit
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

View Schedule1-ResidentialEndUser Connection
    [Arguments]    ${ORI_VALUE}
    Navigate to Schedule1-ResidentialEndUser Connection view page    ${ORI_VALUE}
    Validate Application Details section
    Validate Postal Code and Unit Number section
    Validate View-Residential User Details Section
    Validate View-Validate Requested Date & Time Slot
    Validate View-Technical Details Section
    Validate View-Additional Information section
    Validate View-Priority Circuit Details section
    Validate View-Network Attributes section
    Validate View-Requesting Licensee section
    Validate View-Perform Action Section
    

Cancel Schedule1-ResidentialEndUser Connection
    [Arguments]    ${residential_home_passed}    ${ORI_VALUE}
    Navigate to Schedule1-ResidentialEndUser Connection view page    ${ORI_VALUE}
    Validate User can select 'Cancel Order' and proceed to cancel order page
    #CommonHeaderFooterComponents.Verify 'Cancel Order Page' title
    Validate Cancel-Existing Connection Details section    ${residential_home_passed.ari_value}    
    Validate Cancel Connection Details section
    Validate Cancel-Requesting Licensee section
    Validate Cancel-Submit cancel request
    Verify Cancel-Order confirmation Page
    

Terminate Schedule1-ResidentialEndUser Connection
    [Arguments]    ${ORI_OUTPUT_VALUE}
    Navigate to Schedule1-ResidentialEndUser Connection view page    sch1T
    Validate User can select 'Terminate Order' and proceed to terminate order page
    Validate Terminate-Existing Connection Details section    ${ORI_OUTPUT_VALUE}
    Validate Terminate connection details section
    Validate Terminate-Requesting Licensee section
    Validate Terminate-Submit cancel request
    Verify Terminate-Order confirmation Page


Amend Schedule1-ResidentialEndUser Connection
    [Arguments]    ${CURRENT_STATUS_COMP}    ${ORI_OUTPUT_VALUE}
    Navigate to Schedule1-ResidentialEndUser Connection view page    sch1T
    Validate User can select 'Amend Order' and proceed to amend order page
    Validate Amend-Application Details section    ${CURRENT_STATUS_COMP}    ${ORI_OUTPUT_VALUE} 
    Validate Postal Code and Unit Number section
    Validate Amend-Residential User Details Section
    Validate Amend-Validate Requested Date & Time Slot
    Validate View-Technical Details Section
    Validate View-Additional Information section
    Validate View-Network Attributes section
    Validate Amend-Requesting Licensee section
    Validate Amend-Submit cancel request
    Verify Amend-Order confirmation Page
#*********************************************************************************************************************************************

Navigate to Schedule1-ResidentialEndUser Connection provide page
    Wait Until Element Is Visible    xpath=${ordermanagement_menu_item}
    Click Element     xpath=${ordermanagement_menu_item}
    Wait Until Element Is Visible    xpath=${schedule1_menu_item}
    Click Element     xpath=${schedule1_menu_item}
    Wait Until Element Is Visible    xpath=${schedule1_header}


Navigate to Schedule1-ResidentialEndUser Connection view page
    [Arguments]    ${returned_ori}
    #LoginPage.Login to SWP
    #sleep    5s
    #${view_updated_url}=    Catenate    ${view_url}    ${returned_ori}
    ${url_view}=    Create url    ${view_url}    ${returned_ori}
    sleep    5s
    Go To    ${url_view}   
    sleep    5s

Create url
    [Arguments]    @{args}
    ${url}=        Catenate    SEPARATOR=/        @{args}
    [Return]    ${url}

Validate View-Residential User Details Section
    ResidentialUserDetails.Verify 'Residential User Details' section label and is collapsable
    ResidentialUserDetails.Verify 'Coverage Status' label and is read only and has expected value
    ResidentialUserDetails.Verify 'Building Name' label and is read only and not empty
    ResidentialUserDetails.Verify 'Street Name' label and is read only and not empty
    ResidentialUserDetails.Verify 'Building Type' label and is read only and not empty
    ResidentialUserDetails.Verify 'COPIF Type' label and is read only and not empty
    ResidentialUserDetails.Verify 'Installation Charge' label and is currency formatted, read only and has tooltip icon
    ResidentialUserDetails.Verify 'Service Activation Charge' label and is currency formatted, read only
    ResidentialUserDetails.Verify 'Salutation' field is read only
    ResidentialUserDetails.Verify 'First Name' field is read only
    ResidentialUserDetails.Verify 'Last Name' field is read only
    ResidentialUserDetails.Verify 'Contact Number' field is read only
    ResidentialUserDetails.Verify 'Alt Contact Number' field is read only
    ResidentialUserDetails.Verify 'Email Address' field is read only


Validate Amend-Residential User Details Section
    ResidentialUserDetails.Verify 'Residential User Details' section label and is collapsable
    ResidentialUserDetails.Verify 'Coverage Status' label and is read only and has expected value
    ResidentialUserDetails.Verify 'Building Name' label and is read only and not empty
    ResidentialUserDetails.Verify 'Street Name' label and is read only and not empty
    ResidentialUserDetails.Verify 'Building Type' label and is read only and not empty
    ResidentialUserDetails.Verify 'COPIF Type' label and is read only and not empty
    ResidentialUserDetails.Verify 'Installation Charge' label and is currency formatted, read only and has tooltip icon
    ResidentialUserDetails.Verify 'Service Activation Charge' label and is currency formatted, read only
    ResidentialUserDetails.Verify 'First Name' field is read only
    ResidentialUserDetails.Verify 'Last Name' field is read only
    ResidentialUserDetails.Verify 'Contact Number' field is read only
    ResidentialUserDetails.Verify 'Alt Contact Number' field is read only
    ResidentialUserDetails.Verify 'Email Address' field is read only

    
Validate Requested Date & Time Slot
    RequestedDateAndTimeSlot.Verify 'Requested Date & Time Slot' section label and is collapsable
    RequestedDateAndTimeSlot.Verify 'Time Slot Option' label and is mandatory
	RequestedDateAndTimeSlot.Verify 'Normal Slot' radio button, its label and by default ON
	RequestedDateAndTimeSlot.Verify 'Seasonal Slot' radio button and its label
	RequestedDateAndTimeSlot.Verify 'Requested Date of Activation' label and is mandatory and read only
	RequestedDateAndTimeSlot.Verify 'Requested Date of Activation' calendar clickable
	RequestedDateAndTimeSlot.Verify Provide 'Preferred Installation Session' label and is read only


Validate View-Validate Requested Date & Time Slot
    RequestedDateAndTimeSlot.Verify 'Requested Date & Time Slot' section label and is collapsable
    RequestedDateAndTimeSlot.Verify 'Normal Slot' radio button
    RequestedDateAndTimeSlot.Verify 'Seasonal Slot' radio button
    RequestedDateAndTimeSlot.Verify 'Requested Date of Activation' is read only
    RequestedDateAndTimeSlot.Verify 'Preferred Installation session' field is read only
	
Validate Amend-Validate Requested Date & Time Slot 
    RequestedDateAndTimeSlot.Verify 'Requested Date & Time Slot' section label and is collapsable
    RequestedDateAndTimeSlot.Verify 'Normal Slot' radio button
    RequestedDateAndTimeSlot.Verify 'Seasonal Slot' radio button
    RequestedDateAndTimeSlot.Verify 'Requested Date of Activation' is read only
    RequestedDateAndTimeSlot.Verify 'Preferred Installation session' field is read only
	#RequestedDateAndTimeSlot.Verify by selecting 'Seasonal slot' Reserve button get invisible, RSD and PIS fields got read only

Validate Technical Details
    TechnicalDetails.Verify the 'Technical Details' section label and is collapsable
	TechnicalDetails.Verify the 'Technology' label and is mandatory and dropdown
	TechnicalDetails.Verify the 'Split Ratio' label and is mandatory and dropdown
	TechnicalDetails.Verify the 'Redundancy Service' label and its mandatory
	TechnicalDetails.Verify the 'Required' label and radio button
	TechnicalDetails.Verify the 'Not Required' label, radio button and is ON by default
	TechnicalDetails.Verify that by selecting 'Required' radio button, 'In case redundancy service is unavailable' display
	TechnicalDetails.Verify the 'Reject request' label, radio button and is ON by default
	TechnicalDetails.Verify the 'Do not reject request' label and radio button
	TechnicalDetails.Verify 'Add Additional Information' link and is clickable
	TechnicalDetails.Verify 'Add Additional Information' section label and is collapsable
	TechnicalDetails.Verify 'Additional Information' label and field


Validate View-Additional Information section
    TechnicalDetails.Verify 'Additional Information' label
    #TechnicalDetails.Verify 'Additional Information' is input field
    TechnicalDetails.Verify 'Additional Information' field is read only
    

Validate View-Technical Details Section
    TechnicalDetails.Verify the 'Technical Details' section label and is collapsable on view page
    TechnicalDetails.Verify 'Technology' label view
    TechnicalDetails.Verify 'Technology' field is read only
    TechnicalDetails.Verify 'Split Ratio' label view
    TechnicalDetails.Verify 'Split Ratio' field is read only
    TechnicalDetails.Verify 'Required' radio button is disabled
    TechnicalDetails.Verify 'Not Required' radio button is disabled
    TechnicalDetails.Verify 'Reject Request' radio button is disabled
    TechnicalDetails.Verify 'Do Not Reject Request' radio button is disabled
    


    
Validate Requesting Licensee
    RequestingLicensee.Verify 'Requesting Licensee Name' and 'contact' display by default
    RequestingLicensee.Verify 'Requesting Licensee' section label and collapsable
	RequestingLicensee.Verify 'Requesting Licensee Name' lable and is autopopulated, read only
	RequestingLicensee.Verify 'Designation' label and is autopopulated, read only
	RequestingLicensee.Verify 'Company Name' label and is autopopulated, read only
	RequestingLicensee.Verify 'Contact Number' label and is autopopulated, read only
	RequestingLicensee.Verify 'Fax Number' label and is autopopulated, read only
	RequestingLicensee.Verify 'Email Address' label and is autopopulated, read only


Validate View-Requesting Licensee section
    RequestingLicensee.Verify 'Requesting Licensee Name' lable and is autopopulated, read only view
	RequestingLicensee.Verify 'Designation' label and is autopopulated, read only
	RequestingLicensee.Verify 'Company Name' label and is autopopulated, read only
	RequestingLicensee.Verify 'Contact Number' label and is autopopulated, read only
	RequestingLicensee.Verify 'Fax Number' label and is autopopulated, read only
	RequestingLicensee.Verify 'Email Address' label and is autopopulated, read only
    

Validate Amend-Requesting Licensee section
    RequestingLicensee.Verify 'Requesting Licensee Name' lable and is autopopulated, read only amend
	RequestingLicensee.Verify 'Designation' label and is autopopulated, read only
	RequestingLicensee.Verify 'Company Name' label and is autopopulated, read only
	RequestingLicensee.Verify 'Contact Number' label and is autopopulated, read only
	RequestingLicensee.Verify 'Fax Number' label and is autopopulated, read only
	RequestingLicensee.Verify 'Email Address' label and is autopopulated, read only


    
Verify Order confirmation Page
    #[Arguments]    ${residential_home_passed}
    OrderConfirmationPage.Verify 'Order Confirmation' header message
    OrderConfirmationPage.Verify 'Order Request Identifier' label
    ${output_ori}=    OrderConfirmationPage.Verify 'Order Request Identifier' value against input 
    #OrderConfirmationPage.Verify 'Application Refrerence Identifier' label
    #${output_ari}=    OrderConfirmationPage.Verify 'Application Refrerence Identifier' value against input     ${residential_home_passed.ari_value}
    [Return]    ${output_ori}


Verify Cancel-Order confirmation Page
    OrderConfirmationPage.Verify 'Cancel Order Confirmation' header message
    OrderConfirmationPage.Verify 'Order Request Identifier' label
    ${output_cancel_ori}=    OrderConfirmationPage.Verify 'Order Request Identifier' value against input
    Log to console    ${output_cancel_ori}     


Verify Terminate-Order confirmation Page
    OrderConfirmationPage.Verify 'Termination order confirmation' header message
    OrderConfirmationPage.Verify 'Order Request Identifier' label
    ${output_cancel_ori}=    OrderConfirmationPage.Verify 'Order Request Identifier' value against input
    Log to console    ${output_cancel_ori}  
    
    
Verify Amend-Order confirmation Page  
    OrderConfirmationPage.Verify 'Amend order confirmation' header message
    OrderConfirmationPage.Verify 'Order Request Identifier' label
    ${output_cancel_ori}=    OrderConfirmationPage.Verify 'Order Request Identifier' value against input
    Log to console    ${output_cancel_ori}  

Validate Application Details section
    ApplicationDetails.Verify 'Current status' label and its value label    ${CURRENT_STATUS_ACC}
    ApplicationDetails.Verify 'Application Details' section label and is collapsable
    #ApplicationDetails.Verify 'Order Request Identifier' lable and its value lable
    ApplicationDetails.Verify 'Order Request Identifier' label on view page
    ApplicationDetails.Verify 'Order Request Identifier' value label    ${ori_cancel_page_value}
    ApplicationDetails.Verify 'Application Reference Identifier' lable and field is read only
    #ApplicationDetails.Verify 'Date of Application' lable and its value lable
    #ApplicationDetails.Verify 'Tentative Provision Date' lable and its value lable
    #ApplicationDetails.Verify 'Timeline to Complete' lable and its value lable
    ApplicationDetails.Verify 'Date of Application' lable 
    ApplicationDetails.Verify 'Date of Application' value lable    ${activation_date_value}
    ApplicationDetails.Verify 'Tentative Provision Date' lable
    ApplicationDetails.Verify 'Tentative Provision Date' value lable    ${tentative_provision_date}
    ApplicationDetails.Verify 'Timeline to Complete' lable
    ApplicationDetails.Verify 'Timeline to Complete' value lable    ${timeline_to_complete} 
    ApplicationDetails.Verify 'Reason for Rejection' lable and its value lable

Validate Amend-Application Details section
    [Arguments]    ${curr_status_comp}    ${ori_amend_value}
    ApplicationDetails.Verify Amend 'New Application Reference Identifier' label and is mandatory
    ApplicationDetails.Verify user can fill 'New ARI' inputfield
    ApplicationDetails.Verify 'Current status' label and its value label    ${CURRENT_STATUS_COMP}
    ApplicationDetails.Verify 'Application Details' section label and is collapsable
    ApplicationDetails.Verify 'Order Request Identifier' lable and its value lable    ${ORI_OUTPUT_VALUE}
    ApplicationDetails.Verify Amend 'ARI' label and is mandatory and non empty
    ApplicationDetails.Verify 'Date of Application' lable 
    ApplicationDetails.Verify 'Date of Application' value lable    ${activation_date_value}
    ApplicationDetails.Verify 'Tentative Provision Date' lable
    ApplicationDetails.Verify 'Tentative Provision Date' value lable    ${tentative_provision_date}
    ApplicationDetails.Verify 'Timeline to Complete' lable
    ApplicationDetails.Verify 'Timeline to Complete' value lable    ${timeline_to_complete} 
    ApplicationDetails.Verify 'Reason for Rejection' lable and its value lable


Validate Postal Code and Unit Number section
    PostalCodeAndUnitNumber.Verify 'Postal Code and Unit Number' section label and is collapsable
    PostalCodeAndUnitNumber.Verify 'Postal Code' lable and field is read only
    PostalCodeAndUnitNumber.Verify 'Unit Number' lable and field is read only
    
    
Validate View-Network Attributes section
    NetworkAttributes.Verify 'Network Attributes' section label and is collapsable
    NetworkAttributes.Verify 'Order Type' label and its value label
    NetworkAttributes.Verify 'Redundancy ORI' label and its value label
    NetworkAttributes.Verify 'Provide internal cabling to First TP' label and its value label
    NetworkAttributes.Verify 'Length from Ingress to TP (meters)' label and its value label
    NetworkAttributes.Verify 'Transmission Tie Cable Fibre Strand Identifier' label and its value
    NetworkAttributes.Verify 'QP FDF Transmission Tie Cable Port' label and its value label
    NetworkAttributes.Verify 'Location of TP' label and its value label
    NetworkAttributes.Verify 'Ingress Point' label and its value label
    NetworkAttributes.Verify 'CO Site' label and its value label
    NetworkAttributes.Verify 'FTP Port' label and its value label
    NetworkAttributes.Verify 'Uplink Order Reference' label and its value label
    
Validate View-Priority Circuit Details section
    PriorityCircuitDetails.Verify 'Priority Circuit Details' section label and is collapsable
    PriorityCircuitDetails.Verify 'Priority Circuit' lable and its value label
    PriorityCircuitDetails.Verify 'Priority Charge Indicator' lable and radios disabled    

Validate View-Perform Action Section
    ViewPerformActionSection.Verify 'Perform Action' section label
    ViewPerformActionSection.Verify 'Perform Action' message text
    ViewPerformActionSection.Verify 'Perform Action' section has a dropdown
    ViewPerformActionSection.Verify 'Proceed' button label and is clickable

Validate User can select 'Cancel Order' and proceed to cancel order page
    ViewPerformActionSection.Select value in action dropdown    ${cancel_order_value}
    ViewPerformActionSection.Verify 'Proceed' button label and is clickable


Validate User can select 'Amend Order' and proceed to amend order page
    ViewPerformActionSection.Select value in action dropdown    ${amend_order_value}
    ViewPerformActionSection.Verify 'Proceed' button label and is clickable
    

Validate User can select 'Terminate Order' and proceed to terminate order page
    ViewPerformActionSection.Select value in action dropdown    ${terminate_order_value}
    ViewPerformActionSection.Verify 'Proceed' button label and is clickable
  
    
Validate Cancel-Existing Connection Details section
    [Arguments]    ${ari_input_value}
    Cancel_ExistingConnectionDetailsSection.Verify 'Existing Connection Details' section lable and is collapsable
    Cancel_ExistingConnectionDetailsSection.Verify 'Order Request Identifier' label -Cancel E
    Cancel_ExistingConnectionDetailsSection.Verify 'Order Request Identifier' value label -Cancel E    ${ori_cancel_page_value}
    Cancel_ExistingConnectionDetailsSection.Verify 'Application Reference Identifier' label -Cancel
    Cancel_ExistingConnectionDetailsSection.Verify 'Application Reference Identifier' value label -Cancel    ${ari_input_value}

Validate Terminate-Existing Connection Details section
    [Arguments]    ${ori_output_value}
    Cancel_ExistingConnectionDetailsSection.Verify 'Existing Connection Details' section lable and is collapsable
    Cancel_ExistingConnectionDetailsSection.Verify 'Order Request Identifier' label -Cancel E
    Cancel_ExistingConnectionDetailsSection.Verify 'Order Request Identifier' value label -Cancel E    ${ori_output_value}
    Cancel_ExistingConnectionDetailsSection.Verify 'Application Reference Identifier' label -Cancel
    Cancel_ExistingConnectionDetailsSection.Verify Terminate 'ARI' field is read only field
    
Validate Cancel Connection Details section
    Cancel_CancelConnectionDetailsSection.Verify 'Cancel Connection Details' section label and is collapsable
    Cancel_CancelConnectionDetailsSection.Verify 'Application Reference Identifier' label and is mandatory field -Cancel C
    Cancel_CancelConnectionDetailsSection.Verify 'Add Additional Information' link is present
    
Validate Cancel-Requesting Licensee section
    RequestingLicensee.Verify 'Requesting Licensee' section is collapsable
    RequestingLicensee.Verify 'Requesting Licensee Name' lable and is autopopulated, read only view
	RequestingLicensee.Verify 'Designation' label and is autopopulated, read only
	RequestingLicensee.Verify 'Company Name' label and is autopopulated, read only
	RequestingLicensee.Verify 'Contact Number' label and is autopopulated, read only
	RequestingLicensee.Verify 'Fax Number' label and is autopopulated, read only
	RequestingLicensee.Verify 'Email Address' label and is autopopulated, read only
	Cancel_CancelConnectionDetailsSection.Input value in 'ARI field'


Validate Terminate-Requesting Licensee section
	RequestingLicensee.Verify 'Requesting Licensee' section is collapsable
    RequestingLicensee.Verify 'Requesting Licensee Name' lable and is autopopulated, read only
	RequestingLicensee.Verify 'Designation' label and is autopopulated, read only
	RequestingLicensee.Verify 'Company Name' label and is autopopulated, read only
	RequestingLicensee.Verify 'Contact Number' label and is autopopulated, read only
	RequestingLicensee.Verify 'Fax Number' label and is autopopulated, read only
	RequestingLicensee.Verify 'Email Address' label and is autopopulated, read only
	
Validate Cancel-Submit cancel request
    CommonHeaderFooterComponents.Verify 'Cancellation confirm' modal popup and continue	

Validate Terminate-Submit cancel request	
	CommonHeaderFooterComponents.Verify 'Termination confirm' modal popup and continue   

Validate Amend-Submit cancel request
    CommonHeaderFooterComponents.Verify Amend 'Submit Request' button label and click	 
	 
Validate Terminate connection details section
    TerminateConnectionDetailsSection.Verify 'Terminate Connection Details' section label and is collapsable
    TerminateConnectionDetailsSection.Verify Terminate 'Application Reference Identifier' label and is mandatory
    TerminateConnectionDetailsSection.Verify Terminate 'Requested Date of Termination' label and is mandatory
    TerminateConnectionDetailsSection.Verify user is able to input 'ARI' and can select 'Requested date of termination'
    TerminateConnectionDetailsSection.Verify Terminate 'Add Additional Information' link is present
    