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
Resource    ${CURDIR}${/}/ordering/components/NonResiAddSecondaryContactSection.robot
Resource    ${CURDIR}${/}/ordering/components/NonResiAuthorizedRepresentativeSection.robot
Resource    ${CURDIR}${/}/ordering/components/NonResidentialUserDetailsSection.robot
Resource    ${CURDIR}${/}/ordering/components/NonResiPrimaryContactDetailsSection.robot


*** Variables ***
${ordermanagement_menu_item}    //a[@data-qa='order']
${schedule2_menu_item}    //li[@data-qa='Non-Residential End User Connection']
${schedule2_header}    //*[@id='app-container']//h1/span
${static_ori}    01-01-07022017-101837-A
${view_url}    http://indlin4673:8082/ordermanagement/nonresidentialconnection
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
Provide Schedule2-NonResidentialEndUser Connection
    [Arguments]    ${nonresidential_building_reached}
    Navigate to Schedule2-NonResidentialEndUser Connection provide page
    Title.Validate Title    Request for Non-Residential End User Connection
    ARI.Verify 'ARI' label and it is mandatory, enabled and empty
    #ResidentialUserDetails.Fill 'Application Reference Identifier' inputbox    ${nonresidential_building_reached.ari_value}
    #PostalCodeAndUnitNumber.Validate NonResi Feasibility Check section
    ${postal_code_int}=    Convert To Integer    ${nonresidential_building_reached.postal_code}
    PostalCodeAndUnitNumber.Check Non Resi Feasibility    ${postal_code_int}    ${nonresidential_building_reached.unit_number}
    Validate sch2 'Non-Residential User Details' section    ${nonresidential_building_reached.coverage_status}
    Validate sch2 'Authorized Representative' section    ${nonresidential_building_reached.salutation}    ${nonresidential_building_reached.first_name}    ${nonresidential_building_reached.last_name}    ${nonresidential_building_reached.company_name}    ${nonresidential_building_reached.contact_number}    ${nonresidential_building_reached.alt_contact_num}    ${nonresidential_building_reached.email_address}
    Validate sch2 'Primary Contact Details' section    ${nonresidential_building_reached.first_name}    ${nonresidential_building_reached.last_name}    ${nonresidential_building_reached.company_name}    ${nonresidential_building_reached.contact_number}    ${nonresidential_building_reached.alt_contact_num}    ${nonresidential_building_reached.email_address}
    Validate sch2 'Add Secondary Contact' section    ${nonresidential_building_reached.first_name}    ${nonresidential_building_reached.last_name}    ${nonresidential_building_reached.company_name}    ${nonresidential_building_reached.contact_number}    ${nonresidential_building_reached.alt_contact_num}    ${nonresidential_building_reached.email_address}
    Validate sch2 Requested Date & Time Slot
    Validate sch2 Technical Details
    Validate sch2 Requesting Licensee
    ResidentialUserDetails.Fill 'Application Reference Identifier' inputbox    ${nonresidential_building_reached.ari_value}
    Validate sch2 Order confimration   


View Schedule2-NonResidentialEndUser Connection
    [Arguments]    ${CURRENT_STATUS_COMP}
    Navigate to Schedule1-ResidentialEndUser Connection view page    sch2T
    Validate sch2 View Application Details section    ${CURRENT_STATUS_COMP}
    Validate sch2 View Portal Code and Unit Number section
    Validate sch2 View Non-Residential User Details section
    Validate sch2 View Authorized Representative section
    Validate sch2 View Primary Contact Details section
    Validate sch2 View Secondary Contact Details section
    Validate sch2 View Requested Date & Time Slot section
    Validate sch2 View Technical Details section
    Validate sch2 View Additional Information section
    Validate sch2 View Priority Circuit Details section
    Validate sch2 View Network Attributes section
    Validate sch2 View Requesting Licensee section
    Validate sch2 View Perform Action section   
     

Cancel Schedule2-NonResidentialEndUser Connection
    [Arguments]    ${residential_home_passed}
    Navigate to Schedule1-ResidentialEndUser Connection view page    sch2A
    Validate User can select 'Cancel Order' and proceed to cancel order page
    Validate Cancel-Existing Connection Details section    ${residential_home_passed.ari_value}    
    Validate Cancel Connection Details section
    Validate Cancel-Requesting Licensee section
    Validate Cancel-Submit cancel request
    Verify Cancel-Order confirmation Page
    

Terminate Schedule2-NonResidentialEndUser Connection
    [Arguments]    ${ORI_OUTPUT_VALUE}
    Navigate to Schedule1-ResidentialEndUser Connection view page    sch2T
    Validate User can select 'Terminate Order' and proceed to terminate order page
    Validate Terminate-Existing Connection Details section    ${ORI_OUTPUT_VALUE}
    Validate Terminate connection details section
    Validate Terminate-Requesting Licensee section
    Validate Terminate-Submit cancel request
    Verify Terminate-Order confirmation Page


Amend Schedule2-NonResidentialEndUser Connection
    [Arguments]    ${CURRENT_STATUS_COMP}    ${ORI_OUTPUT_VALUE}
    Navigate to Schedule1-ResidentialEndUser Connection view page    sch2T
    Validate User can select 'Amend Order' and proceed to amend order page
    Validate Amend-Application Details section    ${CURRENT_STATUS_COMP}    ${ORI_OUTPUT_VALUE}
    #Validate sch2 View Application Details section    ${CURRENT_STATUS_COMP}
    Validate sch2 View Portal Code and Unit Number section
    Validate sch2 View Non-Residential User Details section
    Validate sch2 View Authorized Representative section
    Validate sch2 View Primary Contact Details section
    Validate sch2 View Secondary Contact Details section
    Validate sch2 View Requested Date & Time Slot section
    Validate sch2 View Technical Details section
    Validate sch2 View Additional Information section
    #Validate sch2 View Priority Circuit Details section
    Validate sch2 View Network Attributes section
    Validate sch2 View Requesting Licensee section
    Validate Amend-Submit cancel request
    Verify Amend-Order confirmation Page
    
Validate sch2 'Non-Residential User Details' section
    [Arguments]    ${coverage_status}
    ResidentialUserDetails.Verify 'Coverage Status' value is    ${coverage_status}
    ResidentialUserDetails.Verify 'Building Number' label and is a drop-down, mandatory, not empty and tooltip
    ResidentialUserDetails.Verify 'Building Name' label and is read only and not empty
    ResidentialUserDetails.Verify 'Street Name' label and is read only and not empty
    #ResidentialUserDetails.Verify 'Building Type' label and is read only and not empty
    #ResidentialUserDetails.Verify 'COPIF Type' label and is read only and not empty
    ResidentialUserDetails.Verify 'Installation Charge' label and is currency formatted, read only and has tooltip icon
    ResidentialUserDetails.Verify 'Service Activation Charge' label and is currency formatted, read only
    
Validate sch2 'Authorized Representative' section
    [Arguments]    ${salutation}    ${first_name}    ${last_name}    ${company_name}    ${contact_number}    ${alt_contact_num}    ${email_address}
    NonResiAuthorizedRepresentativeSection.Verify sch2 'Authorized Representative' section label and is collapsable
	NonResiAuthorizedRepresentativeSection.Verify sch2 'salutation' label and is mandatory, and a dropdown
	NonResiAuthorizedRepresentativeSection.Verify sch2 'first name' label, enabled and is mandatory
	NonResiAuthorizedRepresentativeSection.Verify sch2 'last name' label, enabled and is mandatory
	NonResiAuthorizedRepresentativeSection.Verify sch2 'company name' label and enabled
	NonResiAuthorizedRepresentativeSection.Verify sch2 'contact number' label, enabled and is mandatory
	NonResiAuthorizedRepresentativeSection.Verify sch2 'alternate contact number' label and enabled
	NonResiAuthorizedRepresentativeSection.Verify sch2 'email address' label and enabled    
    NonResiAuthorizedRepresentativeSection.Verify sch2 user is able to Fill user contact information    ${salutation}    ${first_name}    ${last_name}    ${company_name}    ${contact_number}    ${alt_contact_num}    ${email_address}
    

Validate sch2 'Primary Contact Details' section
    [Arguments]    ${first_name}    ${last_name}    ${company_name}    ${contact_number}    ${alt_contact_num}    ${email_address}
    NonResiPrimaryContactDetailsSection.Verify sch2 'Primary Contact Details' section label and is collapsable
	NonResiPrimaryContactDetailsSection.Verify sch2 primary contact 'first name' label, enabled and is mandatory
	NonResiPrimaryContactDetailsSection.Verify sch2 primary contact 'last name' label, enabled and is mandatory
	NonResiPrimaryContactDetailsSection.Verify sch2 primary contact 'company name' label and enabled
	NonResiPrimaryContactDetailsSection.Verify sch2 primary contact 'contact number' label, enabled and is mandatory
	NonResiPrimaryContactDetailsSection.Verify sch2 primary contact 'alternate contact number' label and enabled
	NonResiPrimaryContactDetailsSection.Verify sch2 primary contact 'email address' label and enabled    
    NonResiPrimaryContactDetailsSection.Verify sch2 user is able to Fill primary contact information    ${first_name}    ${last_name}    ${company_name}    ${contact_number}    ${alt_contact_num}    ${email_address}


Validate sch2 'Add Secondary Contact' section
    [Arguments]    ${first_name}    ${last_name}    ${company_name}    ${contact_number}    ${alt_contact_num}    ${email_address}
    NonResiAddSecondaryContactSection.Verify sch2 'Add Secondary Contact' link is visible and clickable
    NonResiAddSecondaryContactSection.Verify sch2 'Add Secondary Contact' section label and is collapsable
	NonResiAddSecondaryContactSection.Verify sch2 secondary contact 'first name' label and is enabled
	NonResiAddSecondaryContactSection.Verify sch2 secondary contact 'last name' label and is enabled
	NonResiAddSecondaryContactSection.Verify sch2 secondary contact 'company name' label and is enabled
	NonResiAddSecondaryContactSection.Verify sch2 secondary contact 'contact number' label and is enabled
	NonResiAddSecondaryContactSection.Verify sch2 secondary contact 'alternate contact number' label and is enabled
	NonResiAddSecondaryContactSection.Verify sch2 secondary contact 'email address' label and is enabled
    NonResiAddSecondaryContactSection.Verify sch2 user is able to Fill seconday contact information    ${first_name}    ${last_name}    ${company_name}    ${contact_number}    ${alt_contact_num}    ${email_address}


Validate sch2 Requested Date & Time Slot
    RequestedDateAndTimeSlot.Verify sch2 'Requested Date & Time Slot' section label and is collapsable
    # RequestedDateAndTimeSlot.Verify 'Time Slot Option' label and is mandatory
	# RequestedDateAndTimeSlot.Verify 'Normal Slot' radio button, its label and by default ON
	# RequestedDateAndTimeSlot.Verify 'Seasonal Slot' radio button and its label
	RequestedDateAndTimeSlot.Verify 'Requested Date of Activation' label and is mandatory and read only
	RequestedDateAndTimeSlot.Verify 'Requested Date of Activation' calendar clickable
	RequestedDateAndTimeSlot.Verify sch2 date should populate using calendar icon
	RequestedDateAndTimeSlot.Verify Provide 'Preferred Installation Session' label and is read only
	RequestedDateAndTimeSlot.Verify 'Reserve' button is visible, clickable and message
	RequestedDateAndTimeSlot.Verify sch2 'Preferred Installation Session' is enabled and dropdown
    
    
Validate sch2 Technical Details
    TechnicalDetails.Verify the 'Technical Details' section label and is collapsable
	TechnicalDetails.Verify the 'Technology' label and is mandatory and dropdown
	TechnicalDetails.Verify the 'Split Ratio' label and is mandatory and dropdown
	TechnicalDetails.Verify the 'Redundancy Service' label and its mandatory
	TechnicalDetails.Verify the 'Required' label and radio button
	TechnicalDetails.Verify the 'Not Required' label, radio button and is ON by default
	TechnicalDetails.Verify that by selecting 'Required' radio button, 'In case redundancy service is unavailable' display
	TechnicalDetails.Verify the 'Reject request' label, radio button and is ON by default
	TechnicalDetails.Verify the 'Do not reject request' label and radio button
	# TechnicalDetails.Verify 'Add Additional Information' link and is clickable
	# TechnicalDetails.Verify 'Add Additional Information' section label and is collapsable
	# TechnicalDetails.Verify 'Additional Information' label and field

Validate sch2 Requesting Licensee   
    RequestingLicensee.Verify 'Requesting Licensee Name' and 'contact' display by default
    RequestingLicensee.Verify 'Requesting Licensee' section label and collapsable
	RequestingLicensee.Verify 'Requesting Licensee Name' lable and is autopopulated, read only
	RequestingLicensee.Verify 'Designation' label and is autopopulated, read only
	RequestingLicensee.Verify sch2 'Company Name' label and is autopopulated, read only
	RequestingLicensee.Verify 'Contact Number' label and is autopopulated, read only
	RequestingLicensee.Verify 'Fax Number' label and is autopopulated, read only
	RequestingLicensee.Verify 'Email Address' label and is autopopulated, read only
     

Validate sch2 Order confimration
    CommonHeaderFooterComponents.Verify 'Submit Request' button label and click
    Verify sch2 'Provide order confirmation' header message

    
Provide Schedule2-NonResidentialEndUser Connection order submit
    
    
    
Navigate to Schedule2-NonResidentialEndUser Connection provide page
    Wait Until Element Is Visible    xpath=${ordermanagement_menu_item}
    Click Element     xpath=${ordermanagement_menu_item}
    Wait Until Element Is Visible    xpath=${schedule2_menu_item}
    Click Element     xpath=${schedule2_menu_item}
    Wait Until Element Is Visible    xpath=${schedule2_header}

#******************************************************** Schedule 2 View Keywords*******************************************************************

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

Validate sch2 View Application Details section
    [Arguments]    ${CURRENT_STATUS_COMP}
    ApplicationDetails.Verify 'Current status' label and its value label    ${CURRENT_STATUS_COMP}
    ApplicationDetails.Verify 'Application Details' section label and is collapsable
    ApplicationDetails.Verify 'Order Request Identifier' label on view page
    ApplicationDetails.Verify 'Order Request Identifier' value label    ${ori_output_value}
    ApplicationDetails.Verify 'Application Reference Identifier' lable and field is read only
    ApplicationDetails.Verify 'Date of Application' lable 
    ApplicationDetails.Verify 'Date of Application' value lable    ${activation_date_value}
    ApplicationDetails.Verify 'Tentative Provision Date' lable
    ApplicationDetails.Verify 'Tentative Provision Date' value lable    ${tentative_provision_date}
    ApplicationDetails.Verify 'Timeline to Complete' lable
    ApplicationDetails.Verify 'Timeline to Complete' value lable    ${timeline_to_complete} 
    ApplicationDetails.Verify 'Reason for Rejection' lable and its value lable
    

Validate sch2 View Portal Code and Unit Number section
    PostalCodeAndUnitNumber.Verify 'Postal Code and Unit Number' section label and is collapsable
    PostalCodeAndUnitNumber.Verify 'Postal Code' lable and field is read only
    PostalCodeAndUnitNumber.Verify 'Unit Number' lable and field is read only
    PostalCodeAndUnitNumber.Verify 'Installation Option' label and is read only
    
    
Validate sch2 View Non-Residential User Details section
    NonResidentialUserDetailsSection.Verify sch2 'Non Residential User Details' section label and is collapsable
    ResidentialUserDetails.Verify 'Coverage Status' label and is read only and has expected value
    ResidentialUserDetails.Verify 'Building Number' label and is read only and not empty
    ResidentialUserDetails.Verify 'Building Name' label and is read only and not empty
    ResidentialUserDetails.Verify 'Street Name' label and is read only and not empty
    ResidentialUserDetails.Verify 'Installation Charge' label and is currency formatted, read only and has tooltip icon
    ResidentialUserDetails.Verify 'Service Activation Charge' label and is currency formatted, read only
    

Validate sch2 View Authorized Representative section
    NonResiAuthorizedRepresentativeSection.Verify sch2 'Authorized Representative' section label and is collapsable
	NonResiAuthorizedRepresentativeSection.Verify sch2 View 'salutation' label and is read only and autopopulated
	NonResiAuthorizedRepresentativeSection.Verify sch2 View 'first name' label and is read only and autopopulated
	NonResiAuthorizedRepresentativeSection.Verify sch2 View 'last name' label and is read only and autopopulated
	NonResiAuthorizedRepresentativeSection.Verify sch2 View 'company name' label and is read only and autopopulated
	NonResiAuthorizedRepresentativeSection.Verify sch2 View 'contact number' label and is read only and autopopulated
	NonResiAuthorizedRepresentativeSection.Verify sch2 View 'alternate contact number' label and is read only and autopopulated
	NonResiAuthorizedRepresentativeSection.Verify sch2 View 'email address' label and is read only and autopopulated

Validate sch2 View Primary Contact Details section
    NonResiPrimaryContactDetailsSection.Verify sch2 'Primary Contact Details' section label and is collapsable
	NonResiPrimaryContactDetailsSection.Verify sch2 View primary 'first name' label and is read only and autopopulated
	NonResiPrimaryContactDetailsSection.Verify sch2 View primary 'last name' label and is read only and autopopulated
	NonResiPrimaryContactDetailsSection.Verify sch2 View primary 'company name' label and is read only and autopopulated
	NonResiPrimaryContactDetailsSection.Verify sch2 View primary 'contact number' label and is read only and autopopulated
	NonResiPrimaryContactDetailsSection.Verify sch2 View primary 'alternate contact number' label and is read only and autopopulated
	NonResiPrimaryContactDetailsSection.Verify sch2 View primary 'email address' label and is read only and autopopulated    
    

Validate sch2 View Secondary Contact Details section
    NonResiAddSecondaryContactSection.Verify sch2 'Secondary Contact Details' section label and is collapsable
	NonResiAddSecondaryContactSection.Verify sch2 View secondary 'first name' label and is read only and autopopulated
	NonResiAddSecondaryContactSection.Verify sch2 View secondary 'last name' label and is read only and autopopulated
	NonResiAddSecondaryContactSection.Verify sch2 View secondary 'company name' label and is read only and autopopulated
	NonResiAddSecondaryContactSection.Verify sch2 View secondary 'contact number' label and is read only and autopopulated
	NonResiAddSecondaryContactSection.Verify sch2 View secondary 'alternate contact number' label and is read only and autopopulated
	NonResiAddSecondaryContactSection.Verify sch2 View secondary 'email address' label and is read only and autopopulated    
    

Validate sch2 View Requested Date & Time Slot section
    RequestedDateAndTimeSlot.Verify sch2 'Requested Date & Time Slot' section label and is collapsable
    RequestedDateAndTimeSlot.Verify 'Requested Date of Activation' label and is read only and autopopulated
    RequestedDateAndTimeSlot.Verify 'Preferred Installation Session' label and is read only

Validate sch2 View Technical Details section
    TechnicalDetails.View-Technical Details Section validation
    TechnicalDetails.Verify sch2 View 'contact term' label and is read only
    TechnicalDetails.Verify sch2 View 'data center' label and radio buttons are disabled
    TechnicalDetails.Verify sch2 View 'External Data Center Rack Number' label and is read only and autopopulated

Validate sch2 View Additional Information section
    TechnicalDetails.Verify sch2 View 'Additional Information' section label and is collapsable
    TechnicalDetails.Verify 'Additional Information' label
    TechnicalDetails.Verify 'Additional Information' field is read only

Validate sch2 View Priority Circuit Details section
    PriorityCircuitDetails.Verify 'Priority Circuit Details' section label and is collapsable
    PriorityCircuitDetails.Verify 'Priority Circuit' lable and its value label
    PriorityCircuitDetails.Verify 'Priority Charge Indicator' lable and radios disabled
    

Validate sch2 View Network Attributes section
    NetworkAttributes.Verify 'Network Attributes' section label and is collapsable
    NetworkAttributes.Verify sch2 View 'Order Type' label and its value label
    NetworkAttributes.Verify 'Redundancy ORI' label and its value label
    NetworkAttributes.Verify 'Transmission Tie Cable Fibre Strand Identifier' label and its value
    NetworkAttributes.Verify 'RL FDF Transmission Tie Cable Port' label and its value label
    NetworkAttributes.Verify 'CO Site' label and its value label
    NetworkAttributes.Verify 'FTP Port' label and its value label
    NetworkAttributes.Verify 'Uplink Order Reference' label and its value label
    

Validate sch2 View Requesting Licensee section
    RequestingLicensee.Verify sch2 View 'Requesting Licensee' section is collapsable
	RequestingLicensee.Verify 'Requesting Licensee Name' lable and is autopopulated, read only
	RequestingLicensee.Verify 'Designation' label and is autopopulated, read only
	RequestingLicensee.Verify 'Company Name' label and is autopopulated, read only
	RequestingLicensee.Verify 'Contact Number' label and is autopopulated, read only
	RequestingLicensee.Verify 'Fax Number' label and is autopopulated, read only
	RequestingLicensee.Verify 'Email Address' label and is autopopulated, read only

Validate sch2 View Perform Action section
    ViewPerformActionSection.Verify 'Perform Action' section label
    ViewPerformActionSection.Verify 'Perform Action' message text
    ViewPerformActionSection.Verify 'Perform Action' section has a dropdown
    ViewPerformActionSection.Verify 'Proceed' button label and is clickable
    
#*************************************************************** Schedule2 Terminate keywords ************************************************************************
    
Validate User can select 'Terminate Order' and proceed to terminate order page
    ViewPerformActionSection.Select value in action dropdown    ${terminate_order_value}
    ViewPerformActionSection.Verify 'Proceed' button label and is clickable

Validate Terminate-Existing Connection Details section
    [Arguments]    ${ori_output_value}
    Cancel_ExistingConnectionDetailsSection.Verify 'Existing Connection Details' section lable and is collapsable
    Cancel_ExistingConnectionDetailsSection.Verify 'Order Request Identifier' label -Cancel E
    Cancel_ExistingConnectionDetailsSection.Verify 'Order Request Identifier' value label -Cancel E    ${ori_output_value}
    Cancel_ExistingConnectionDetailsSection.Verify 'Application Reference Identifier' label -Cancel
    Cancel_ExistingConnectionDetailsSection.Verify Terminate 'ARI' field is read only field

Validate Terminate connection details section
    TerminateConnectionDetailsSection.Verify 'Terminate Connection Details' section label and is collapsable
    TerminateConnectionDetailsSection.Verify Terminate 'Application Reference Identifier' label and is mandatory
    TerminateConnectionDetailsSection.Verify Terminate 'Requested Date of Termination' label and is mandatory
    TerminateConnectionDetailsSection.Verify user is able to input 'ARI' and can select 'Requested date of termination'
    TerminateConnectionDetailsSection.Verify Terminate 'Add Additional Information' link is present

Validate Terminate-Requesting Licensee section
	RequestingLicensee.Verify 'Requesting Licensee' section is collapsable
    RequestingLicensee.Verify 'Requesting Licensee Name' lable and is autopopulated, read only
	RequestingLicensee.Verify 'Designation' label and is autopopulated, read only
	RequestingLicensee.Verify 'Company Name' label and is autopopulated, read only
	RequestingLicensee.Verify 'Contact Number' label and is autopopulated, read only
	RequestingLicensee.Verify 'Fax Number' label and is autopopulated, read only
	RequestingLicensee.Verify 'Email Address' label and is autopopulated, read only

Validate Terminate-Submit cancel request	
	CommonHeaderFooterComponents.Verify 'Termination confirm' modal popup and continue   
	
	
Verify Terminate-Order confirmation Page
    OrderConfirmationPage.Verify 'Termination order confirmation' header message
    OrderConfirmationPage.Verify 'Order Request Identifier' label
    ${output_cancel_ori}=    OrderConfirmationPage.Verify 'Order Request Identifier' value against input
    Log to console    ${output_cancel_ori}  

#******************************************************************* Schedul2 Amend keywords ****************************************************************************
    
Validate User can select 'Amend Order' and proceed to amend order page
    ViewPerformActionSection.Select value in action dropdown    ${amend_order_value}
    ViewPerformActionSection.Verify 'Proceed' button label and is clickable

    
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

Validate Amend-Submit cancel request
    CommonHeaderFooterComponents.Verify 'Submit Request' button label and click	 
	

Verify Amend-Order confirmation Page  
    OrderConfirmationPage.Verify sch2 'Amend order confirmation' header message
    OrderConfirmationPage.Verify 'Order Request Identifier' label
    ${output_cancel_ori}=    OrderConfirmationPage.Verify 'Order Request Identifier' value against input
    Log to console    ${output_cancel_ori}  

#******************************************************************* Schedule 2 Cancel order keywords *********************************************************************

Validate Cancel-Existing Connection Details section
    [Arguments]    ${ari_input_value}
    Cancel_ExistingConnectionDetailsSection.Verify 'Existing Connection Details' section lable and is collapsable
    Cancel_ExistingConnectionDetailsSection.Verify 'Order Request Identifier' label -Cancel E
    Cancel_ExistingConnectionDetailsSection.Verify 'Order Request Identifier' value label -Cancel E    ${ori_output_value}
    Cancel_ExistingConnectionDetailsSection.Verify 'Application Reference Identifier' label -Cancel
    Cancel_ExistingConnectionDetailsSection.Verify 'Application Reference Identifier' value label -Cancel    ${ari_input_value}

Validate User can select 'Cancel Order' and proceed to cancel order page
    ViewPerformActionSection.Select value in action dropdown    ${cancel_order_value}
    ViewPerformActionSection.Verify 'Proceed' button label and is clickable

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

Validate Cancel-Submit cancel request
    CommonHeaderFooterComponents.Verify 'Cancellation confirm' modal popup and continue	

Verify Cancel-Order confirmation Page
    OrderConfirmationPage.Verify 'Cancel Order Confirmation' header message
    OrderConfirmationPage.Verify 'Order Request Identifier' label
    ${output_cancel_ori}=    OrderConfirmationPage.Verify 'Order Request Identifier' value against input
    Log to console    ${output_cancel_ori}     
