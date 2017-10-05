*** Settings ***
Library    Selenium2Library
Library  OperatingSystem
Resource    ${CURDIR}${/}/PO/LoginPage.robot

*** Variables ***
${SWP_URL}    http://indlin4673:8082/login
${BROWSER}    gc
${GRID_URL}    http://10.75.192.102:4444/wd/hub
${DESIRED_CAPABILITIES}     platform:WINDOWS,browser:chrome
${ALIAS}                    None

*** Keywords ***
Open SWP
    Open Browser    ${SWP_URL}    ${BROWSER}    ${ALIAS}    #${GRID_URL}    ${DESIRED_CAPABILITIES}
    Maximize Browser Window
    Set Selenium Timeout    20
    #Set Selenium Speed    1
    Set Browser Implicit Wait    1
    LoginPage.Login to SWP
        
Close SWP
    #Run Keyword If Test Failed    Capture full page screenshot
    Close Browser
    
#Capture full page screenshot
#    Log TODO: not fully functional yet!!!!
#    ${screenshot_file_name}=    Concate    ${TEST NAME}    .png
#    Capture and crop page screenshot         ${screenshot_file_name}

Verify field is mandatory
    [Arguments]    ${locator}
    ${element_label}=	Get Text	${locator}
	${result}=	Run Keyword And Return Status    Element Label Contains star    ${element_label}
	Run Keyword If	  ${result}==True    Log To Console    ${element_label}, is mandatory field   ELSE	    Log To Console    ${element_label}, is non mandatory field		

Element Label Contains star
	[Arguments]    ${element_label}
	Should Contain    ${element_label}    *	
	

Verify field label
	[Arguments]    ${locator}    ${element_label_value}
	Wait Until Page Contains Element    ${locator}    10s    
	${element_label}=    Get Text    ${locator}
	Should Contain	 ${element_label}    ${element_label_value}	


Verify section is collapsable
    [Arguments]    ${visible_locator}    ${section_toggle_locator}
    Element Should Be Visible    ${visible_locator} 
    Click Element    ${section_toggle_locator}
    Wait Until Element Is Not Visible    ${visible_locator} 
    Element Should Not Be Visible    ${visible_locator} 
    Click Element    ${section_toggle_locator}
    Wait Until Element Is Visible    ${visible_locator}
    Element Should Be Visible    ${visible_locator}
    
    
Verify section is expandable
    [Arguments]    ${invisible_locator}    ${section_toggle_locator}
    Element Should Not Be Visible    ${invisible_locator}
    Click Element    ${section_toggle_locator}
    Wait Until Element Is Visible    ${invisible_locator} 
    Element Should Be Visible    ${invisible_locator}    
    
    
Verify field is drop-down
    [Arguments]    ${locator}
    @{list_option_values}=    Get List Items    ${locator}
    ${list_size}    Get Length    ${list_option_values}
    Should Be True    ${list_size} > 1
    
    
    