*** Setting ***
Library    Selenium2Library
Resource    ${CURDIR}${/}../../../Common.robot


*** Variable ***
@{requested_date_&_time_slot_section_header_label}    xpath=//section/div[@data-qa='rfa_installation_session']
@{requested_date_&_time_slot_section_header_label_value}    Requested Date & Time Slot
@{requested_date_&_time_slot_section_header}    //section/div[@data-qa='rfa_installation_session']/h2
${requested_date_&_time_slot_section_toggle}    xpath=//section/div[@data-qa='rfa_installation_session']
${time_slot_option_label}    //label[@data-qa='time_slot_label']
${time_slot_option_label_value}    Time Slot Option*
${normal_slot_radio_button_group}    TIMESLOT_TYPE_SELECTOR_NAME
${normal_slot_radio_button}    //input[@data-qa='normal']
${normal_slot_radio_label}    //input[@data-qa='normal']/following::span[1]
${normal_slot_radio_label_value}    Normal Slot
${seasonal_slot_radio_button}    //input[@data-qa='seasonal'] 
${seasonal_slot_radio_label}    //input[@data-qa='normal']/following::span[2]
${seasonal_slot_radio_label_value}    Seasonal Slot
${requested_date_of_activation_label}    //label[@data-qa='activation_date_label']
${requested_date_of_activation_label_value}    Requested Date of Activation
${requested_date_of_activation_field}    //input[@id='daypicker_rfa']
${requested_date_selection}    //div[@aria-label= 'Wed Oct 25 2017']
${sch2_requested_date_selection}    //div[@aria-label= 'Sat Oct 28 2017']
${requested_date_of_activation_datepicker}    //img[@data-qa='calendar_icon']
${requested_date_of_activation_enabled_dates}    //div[@class='DayPicker-Week']/div[@aria-disabled='false']
${calendar_next_month_button}    //div[@class='DayPicker-NavBar']/span[2]
${preferred_installation_session_label}    //label[@data-qa='installation_session_label']
${preferred_installation_session_label_value}    Preferred Installation Session
${preferred_installation_session_field}    //select[@data-qa='timepicker']
${preferred_installation_session_label_value_mandatory}    Preferred Installation Session*
${reserve_button}    //button[@data-qa='rfa_timeslot_btn_reserve']
${reservation_message}    //span[text()='Please note, your selected reservation will expire in 5 minutes']




*** Keyword ***
Verify section
    Verify 'Requested Date & Time Slot' section label and is collapsable
    Verify 'Time Slot Option' label and is mandatory
	Verify 'Normal Slot' radio button, its label and by default ON
	Verify 'Seasonal Slot' radio button and its label
	Verify 'Requested Date of Activation' label and is mandatory and read only
	Verify 'Requested Date of Activation' calendar clickable
	Verify 'Preferred Installation Session' dropdown get enabled by selecting 'Requested Date of Activation' 
	#Verify 'Preferred Installation Session' dropdown option
	#Verify 'Reserve button' get disabled once clicked
	#Verify 'Reserve button' get enabled, once time changed in dropdown
	Verify date should populate using calendar icon
	#Verify 'Preferred Installation Session' label and is read only
	Verify 'Reserve' button is visible, clickable and message


View-Requested Date & Time Slot Section validation
    Verify 'Requested Date & Time Slot' section label and is collapsable
    Verify 'Normal Slot' radio button
    Verify 'Seasonal Slot' radio button
    Verify 'Requested Date of Activation' is read only
    Verify 'Preferred Installation session' field is read only

     
Amend-Requested Date & Time Slot Section validation
    Verify 'Requested Date & Time Slot' section label and is collapsable
    Verify 'Time Slot Option' label and is mandatory
	Verify 'Normal Slot' radio button, its label and by default ON
	Verify 'Seasonal Slot' radio button and its label
	Verify 'Requested Date of Activation' label and is mandatory, read only and autopopulated
	Verify calendar icon is clickable
	Verify 'Preferred Installation Session' label and is mandatory and autoselected
	Verify 'Reserve button' is disabled
	#Verify by selecting 'Seasonal slot' Reserve button get invisible, RSD and PIS fields got read only
	  
     

Verify 'Requested Date & Time Slot' section label and is collapsable
    Verify 'Requested Date & Time Slot' section label
    Verify 'Requested Date & Time Slot' section is collapsable

Verify sch2 'Requested Date & Time Slot' section label and is collapsable
    Verify 'Requested Date & Time Slot' section label
    Verify sch2 'Requested Date & Time Slot' section is collapsable

    
Verify 'Time Slot Option' label and is mandatory 
    Verify 'Time Slot Option' label
    Verify 'Time Slot Option' is mandatory

Verify 'Normal Slot' radio button, its label and by default ON 
   Verify 'Normal Slot' label
   Verify 'Normal Slot' radio button
   Verify 'Normal Slot' is ON by default
   
Verify 'Seasonal Slot' radio button and its label
   Verify 'Seasonal Slot' label
   Verify 'Seasonal Slot' radio button

Verify 'Requested Date of Activation' label and is mandatory and read only
   Verify 'Requested Date of Activation' label
   Verify 'Requested Date of Activation' is mandatory    
   Verify 'Requested Date of Activation' is read only
   
Verify 'Requested Date of Activation' calendar clickable
    Verify 'Requested Date of Activation' calendar icon 


Verify 'Requested Date of Activation' label and is mandatory, read only and autopopulated
    Verify 'Requested Date of Activation' label
    Verify 'Requested Date of Activation' is mandatory
    Verify 'Requested Date of Activation' is read only
    Verify 'Requested Date of Activation' is autopopulated

Verify calendar icon is clickable
    Click Element    ${requested_date_of_activation_datepicker}
    Click Element    ${requested_date_of_activation_datepicker}

Verify 'Preferred Installation Session' label and is mandatory and autoselected
    Verify 'Preferred Installation session' label
    Verify 'Preferred Installation session' field is mandatory
    Verify 'Preferred Installation session' field is autoselected

Verify 'Reserve button' is disabled
    Element Should Be Disabled    ${reserve_button}

Verify by selecting 'Seasonal slot' Reserve button get invisible, RSD and PIS fields got read only
    Verify user can select 'Seasonal slot' radio button
    Verify 'Reserve' button is invisible on page
    Verify 'Req date of Act' field is read only
    Verify 'Pref inst sess' field is read only
    Verify calendar icon is clickable 


Verify 'Preferred Installation Session' dropdown get enabled by selecting 'Requested Date of Activation'
    Element Should Be Disabled    ${preferred_installation_session_field}
    #Select From List By Index    ${requested_date_of_activation_dropdown}    1
    Click Element    ${requested_date_of_activation_datepicker}
    Element Should Be Visible    ${preferred_installation_session_field}
    #Need to implement
       
Verify 'Preferred Installation Session' dropdown option
    @{building_number_values}=    Get List Items    ${building_number_field}
    ${list_size}    Get Length    ${building_number_values}
    # Should Be True    ${list_size} > 1
   
Verify 'Reserve' button is visible, clickable and message
    Verify 'Reserve button' is visible
    Verify 'Reserve button' is clickable
    Verify date reservation message on clicking 'Reserve button'
    
# Verify 'Reserve button' get disabled once clicked
    # Click Element    
   
# Verify 'Reserve button' get enabled, once time changed in dropdown   
   
Verify date should populate using calendar icon
    # Click Element    ${requested_date_of_activation_datepicker}
    # sleep    5s
    # Click Element    ${requested_date_selection}
    Select enabled activation date from calendar
    

Verify sch2 date should populate using calendar icon
    # Click Element    ${requested_date_of_activation_datepicker}
    # sleep    5s
    # Click Element    ${sch2_requested_date_selection}    
    Select enabled activation date from calendar
    
Verify Provide 'Preferred Installation Session' label and is read only    
    Verify Provide 'Preferred Installation session' label
    Verify 'Preferred Installation session' is read only    
    
    
Verify 'Preferred Installation Session' label and is read only
    Verify 'Preferred Installation session' label
    Verify 'Preferred Installation session' is read only
  
Verify sch2 'Preferred Installation Session' is enabled and dropdown
    Verify sch2 'Preferred Installation Session' is enabled
    Verify sch2 'Preferred Installation Session' is dropdown
    
Verify sch2 'Preferred Installation Session' is enabled
    Element Should Be Enabled    ${preferred_installation_session_field}
    
Verify sch2 'Preferred Installation Session' is dropdown
    @{preferred_inst_values}=    Get List Items    ${preferred_installation_session_field}
    ${list_size}    Get Length    ${preferred_inst_values}
    Should Be True    ${list_size} > 1   
    
Verify 'Requested Date & Time Slot' section label
    Element Text Should Be    @{requested_date_&_time_slot_section_header_label}    @{requested_date_&_time_slot_section_header_label_value}


Verify 'Requested Date & Time Slot' section is collapsable
    Element Should Be Visible    ${time_slot_option_label} 
    Click Element    ${requested_date_&_time_slot_section_toggle}
    Wait Until Element Is Not Visible    ${time_slot_option_label}
    Element Should Not Be Visible    ${time_slot_option_label} 
    Click Element    ${requested_date_&_time_slot_section_toggle}
    Wait Until Element Is Visible    ${time_slot_option_label} 
    Element Should Be Visible    ${time_slot_option_label} 


Verify sch2 'Requested Date & Time Slot' section is collapsable
    Element Should Be Visible    ${requested_date_of_activation_label} 
    Click Element    ${requested_date_&_time_slot_section_toggle}
    Wait Until Element Is Not Visible    ${requested_date_of_activation_label}
    Element Should Not Be Visible    ${requested_date_of_activation_label} 
    Click Element    ${requested_date_&_time_slot_section_toggle}
    Wait Until Element Is Visible    ${requested_date_of_activation_label} 
    Element Should Be Visible    ${requested_date_of_activation_label} 

    
Verify 'Time Slot Option' label
    #Element Text Should Be    ${time_slot_option_label}    ${time_slot_option_label_value}
    Common.Verify field label    ${time_slot_option_label}    ${time_slot_option_label_value}
    
Verify 'Time Slot Option' is mandatory
    #Element Should Contain    ${time_slot_option_label}    *
    Common.Verify field is mandatory    ${time_slot_option_label}
    
Verify 'Normal Slot' label
    #Element Text Should Be    ${normal_slot_radio_label}    ${normal_slot_radio_label_value}
    Common.Verify field label    ${normal_slot_radio_label}    ${normal_slot_radio_label_value}
    
Verify 'Normal Slot' radio button
    Page Should Contain Radio Button    ${normal_slot_radio_button}    message=Radio button not found    loglevel=INFO
   
Verify 'Normal Slot' is ON by default
    Radio Button Should Be Set To    ${normal_slot_radio_button_group}    normal
    
    
Verify 'Seasonal Slot' label
    #Element Text Should Be    ${seasonal_slot_radio_label}    ${seasonal_slot_radio_label_value}
    Common.Verify field label    ${seasonal_slot_radio_label}    ${seasonal_slot_radio_label_value}
 
Verify 'Seasonal Slot' radio button
    Page Should Contain Radio Button    ${seasonal_slot_radio_button}    message=Radio button not found    loglevel=INFO
    
Verify 'Requested Date of Activation' label
    #Element Text Should Be    ${requested_date_of_activation_label}    ${requested_date_of_activation_label_value}
    Common.Verify field label    ${requested_date_of_activation_label}    ${requested_date_of_activation_label_value}
    
    
Verify 'Requested Date of Activation' is mandatory
    #Element Should Contain    ${requested_date_of_activation_label}    *
    Common.Verify field is mandatory    ${requested_date_of_activation_label}
       
Verify 'Requested Date of Activation' is read only
    Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${requested_date_of_activation_field}    123
    
Verify 'Requested Date of Activation' calendar icon
    Element Should Be Visible    ${requested_date_of_activation_datepicker}
    

Verify 'Reserve button' is visible
    Element Should Be Visible    ${reserve_button}
    sleep    5s
    
    
Verify 'Reserve button' is clickable
    Click Button    ${reserve_button}
    
Verify date reservation message on clicking 'Reserve button'
    Element Should Be Visible    ${reservation_message}


Verify Provide 'Preferred Installation session' label
    #Element Text Should Be    ${preferred_installation_session_label}    ${preferred_installation_session_label_value}
    Common.Verify field label    ${preferred_installation_session_label}    ${preferred_installation_session_label_value}  

Verify 'Preferred Installation session' label
    #Element Text Should Be    ${preferred_installation_session_label}    ${preferred_installation_session_label_value_mandatory}
    Common.Verify field label    ${preferred_installation_session_label}    ${preferred_installation_session_label_value}
    
Verify 'Preferred Installation session' is read only
    
    @{pereferred_Installation_values}=    Get List Items    ${preferred_installation_session_field}
    ${list_size}    Get Length    ${pereferred_Installation_values}
    Should Be True    ${list_size}>0
    
 Verify 'Preferred Installation session' field is read only   
     Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${preferred_installation_session_field}    123
     
     
Select enabled activation date from calendar
    Click Element    ${requested_date_of_activation_datepicker} 
    ${count}    Get Matching Xpath Count    //div[@class='DayPicker-Week']/div[@aria-disabled='false']
    # ${count}=    Set Variable    31
    ${count_int}    Convert To Integer    ${count}
    Run Keyword If    ${count_int}>0    Iterate through enabled dates in calendar and select    ${count_int}    ELSE    Click on next month button
    Iterate through enabled dates in calendar and select    ${count_int}
    
Iterate through enabled dates in calendar and select
    [Arguments]    ${counter}
    :FOR    ${i}    IN RANGE    0    ${counter}
    \    ${element}=    Catenate    SEPARATOR=,    //div[@class='DayPicker-Week']/div[@aria-disabled='false' and contains(@aria-label    '${i}')]
    \    ${result}=    Run Keyword And Return Status    Element Should Be Visible    ${element}    
    \    Run Keyword If    ${result}==True    Click Element    ${element}
    \    Exit For Loop If    ${result}==True
    
# Click first list element
    # [Arguments]    ${first_webelemet}
    # #${first_webelemet}    Get value from list    ${list}    ${index}
    # Click Element    ${first_webelemet}
    
Click on next month button
    Click Element    ${calendar_next_month_button}
    

# Amend requested date and time slot section

Verify 'Requested Date of Activation' is autopopulated
    ${req_act_date}=    Get Element Attribute    ${requesting_licensee_name_inputbox}@value
    Should Not Be Equal As Strings    ${req_act_date}    ${empty}
    
Verify 'Preferred Installation session' field is mandatory
    #Element Should Contain    ${preferred_installation_session_label}    *
    Common.Verify field is mandatory    ${preferred_installation_session_label}
    
Verify 'Preferred Installation session' field is autoselected
    ${pref_inst_time}    Get Selected List Label    ${preferred_installation_session_field}
    Should Not Be Empty    ${pref_inst_time}    

 Verify user can select 'Seasonal slot' radio button
     Select Radio Button    ${normal_slot_radio_button_group}    seasonal    
 
 Verify 'Reserve' button is invisible on page
     Element Should Not Be Visible    ${reserve_button}
 
 Verify 'Req date of Act' field is read only
     Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${requested_date_of_activation_field}    123
 
 Verify 'Pref inst sess' field is read only
     Run Keyword And Expect Error    *Element is not currently interactable and may not be manipulated*    Input Text    ${preferred_installation_session_field}    123
     
#***************************************************** schedule 2 View requested date and time keywords*****************************************************************

Verify sch2 View 'Requested Date and Time slot' section
    Verify 'Requested Date & Time Slot' section label and is collapsable
    Verify 'Requested Date of Activation' label and is read only and autopopulated
    Verify 'Preferred Installation Session' label and is read only
    

Verify 'Requested Date of Activation' label and is read only and autopopulated
    Verify 'Requested Date of Activation' label
    Verify 'Requested Date of Activation' is read only
    Verify 'Requested Date of Activation' is autopopulated    
    
    
#********************************************************** Calendra sample code ************************************************************************************
    
Select Date From yui Calendar
    [Arguments]    ${date}    ${xpath}=//div[contains(@class,'yui-calcontainer')]    ${max months}=24
    [Documentation]    `date` must be in format MM/DD/YYYY (0-padded or not).
    ...
    ...    xpath should point to the div that has class yui-calcontainer. `max months` is the maximum amount of months the keyword will go forward or backword from the currently displayed month.
    ${month}    ${day}    ${year}    Evaluate    [int(n) for n in "${date}".split("/")]
    ${target}    Evaluate    datetime.datetime(${year}, ${month}, ${day})    datetime
    ${current month and year}    Get Text    xpath=${xpath}//div[@class='calheader']    # current here refers to state of calendar at start of keyword
    ${current month name}    ${current year}    Set Variable    ${current month and year.strip().split()}
    ${current month}    Evaluate    list(calendar.month_name).index('${current month name}')    calendar    # name -> index
    ${current}    Evaluate    datetime.datetime(${current year}, ${current month}, 1)    datetime
    ${diff}    Evaluate    (${current.__repr__()} - ${target.__repr__()}).days    datetime
    ${month name}    Evaluate    calendar.month_name[${month}]    calendar
    : FOR    ${i}    IN RANGE    ${max months}
    \    ${cal month and year}    Get Text    xpath=${xpath}//div[@class='calheader']
    \    ${cal month}    ${cal year}    Set Variable    ${cal month and year.strip().split()}
    \    Run Keyword If    '${cal month}'=='${month name}' and ${cal year}==${year}    Exit For Loop
    \    Run Keyword If    ${diff} > 0    Click Element    xpath=${xpath}//a[@class="calnavleft"]
    \    Run Keyword If    ${diff} < 0    Click Element    xpath=${xpath}//a[@class="calnavright"]
    ${available}    Get Matching Xpath Count    ${xpath}//a[.=${day.__repr__()}]
    Run Keyword If    ${available}    Click Element    xpath=${xpath}//a[.=${day.__repr__()}]
    Run Keyword Unless    ${available}    Log    Date ${date} not available for selection
    Run Keyword Unless    ${available}    Click Element    xpath=//*[@id='productDeliveryDateCalContainer']/a/span    #close the calendar
    [Return]    ${available} 