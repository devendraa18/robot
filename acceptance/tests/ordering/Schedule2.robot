coding: ascii
*** Settings ***
Documentation    Schedule#2 Test Cases
Library    ExcelLibrary
Library    Collections
Library    FakerLibrary    locale=en_US   
Resource    ${CURDIR}${/}../../Resources/Common.robot    #setup and tear down
Resource    ${CURDIR}${/}../../Resources/PO/Schedule2-NonResidentialEndUser.robot
Resource    ${CURDIR}${/}../../Resources/PO/ordering/components/Constants.robot
Test Setup    Common.Open SWP
Test Teardown    Common.Close SWP
#Force Tags    regression    
Default Tags    sanity

*** Variables ***
${data_file}    ${CURDIR}${/}/../../data/TestData.xls
@{data_set_list}=    Get Excel Data
${residential_provide_view_data_sheet}    'non_residential_provide_view'
${returned_ori}


*** Test Cases ***
# Set constant global variables
    # [Tags]    onlysch
    # Set constant global variables    
    
Provide Schedule2-NonResidentialEndUser Connection
    [Tags]    sanity
    #Set constant global variables
    @{data_set_list}=    Get Excel Data    ${residential_provide_view_data_sheet}
    :FOR    ${data_set}    IN    @{data_set_list} 
    \    Log    ${data_set}
    \    Provide Schedule2-NonResidentialEndUser Connection    ${data_set}
   # ${address}=    FakerLibrary.Address
   # Log    ${address}
    # &{data_set}=    Create Dictionary    
    # ...    postal_code=111111    
    # ...    unit_number=01-02    
    # ...    coverage_status=Home Passed
    # Provide Schedule2-ResidentialEndUser Connection    ${data_set}


Provide Schedule2-NonResidentialEndUser Connection order submit
    [Tags]    onlysch
    #Set Global Variable    ${captured_ori_value}
    @{data_set_list}=    Get Excel Data    ${residential_provide_view_data_sheet}
    :FOR    ${data_set}    IN    @{data_set_list} 
    \    Log    ${data_set}
    \    Provide Schedule2-NonResidentialEndUser Connection order submit    ${data_set}

View Schedule2-NonResidentialEndUser Connection
    [Tags]    sanity
    #Set Global Variable    ${captured_ori_value}
    # @{data_set_list}=    Get Excel Data    ${residential_provide_view_data_sheet}
    # :FOR    ${data_set}    IN    @{data_set_list} 
    # \    Log    ${data_set}
    # \    View Schedule2-ResidentialEndUser Connection    ${data_set}
    View Schedule2-NonResidentialEndUser Connection    ${CURRENT_STATUS_COMP}
    
    
Cancel Schedule2-NonResidentialEndUser Connection
    [Tags]    sanity
    @{data_set_list}=    Get Excel Data    ${residential_provide_view_data_sheet}
    :FOR    ${data_set}    IN    @{data_set_list} 
    \    Log    ${data_set}
    \    Cancel Schedule2-NonResidentialEndUser Connection    ${data_set}    
 

Terminate Schedule2-NonResidentialEndUser Connection
    [Tags]    sanity
    
    # @{data_set_list}=    Get Excel Data    ${residential_provide_view_data_sheet}
    # :FOR    ${data_set}    IN    @{data_set_list} 
    # \    Log    ${data_set}
    # \    Terminate Schedule2-ResidentialEndUser Connection    ${data_set}    ${ORI_VALUE}    
    Terminate Schedule2-NonResidentialEndUser Connection    ${ORI_OUTPUT_VALUE} 


Amend Schedule2-NonResidentialEndUser Connection
    [Tags]    sanity
    # @{data_set_list}=    Get Excel Data    ${residential_provide_view_data_sheet}
    # :FOR    ${data_set}    IN    @{data_set_list} 
    # \    Log    ${data_set}
    # \    Terminate Schedule2-ResidentialEndUser Connection    ${data_set}    ${ORI_VALUE}    
    Amend Schedule2-NonResidentialEndUser Connection    ${CURRENT_STATUS_ACC}    ${ORI_OUTPUT_VALUE} 
 
    
*** Keywords ***
# Set constant global variables
    # Constants.Set constant global variables for field labels and other static values


Provide Schedule2-NonResidentialEndUser Connection
    [Arguments]    ${data_set}
    Schedule2-NonResidentialEndUser.Provide Schedule2-NonResidentialEndUser Connection    ${data_set}
    Set Suite Variable    ${ORI_OUTPUT_VALUE}    01-01-07022017-101837-A
    Set Suite Variable    ${CURRENT_STATUS_ACC}    Accepted
    Set Suite Variable    ${CURRENT_STATUS_COMP}    Completed

Provide Schedule2-NonResidentialEndUser Connection order submit
    [Arguments]    ${data_set}
    ${returned_ori}=    Schedule2-NonResidentialEndUser.Provide Schedule2-NonResidentialEndUser Connection order submit   ${data_set}
    Set Suite Variable    ${ORI_VALUE}    ${returned_ori}
    # Set Suite Variable    ${ORI_OUTPUT_VALUE}    01-01-07022017-101837-A
    # Set Suite Variable    ${CURRENT_STATUS_ACC}    Accepted
    # Set Suite Variable    ${CURRENT_STATUS_COMP}    Completed
    
View Schedule2-NonResidentialEndUser Connection
    [Arguments]    ${curr_status}
    Schedule2-NonResidentialEndUser.View Schedule2-NonResidentialEndUser Connection    ${curr_status}
    

Cancel Schedule2-NonResidentialEndUser Connection
    [Arguments]    ${data_set}
    Schedule2-NonResidentialEndUser.Cancel Schedule2-NonResidentialEndUser Connection    ${data_set}
    

Terminate Schedule2-NonResidentialEndUser Connection
    [Arguments]    ${ORI_OUTPUT_VALUE}
    Schedule2-NonResidentialEndUser.Terminate Schedule2-NonResidentialEndUser Connection    ${ORI_OUTPUT_VALUE}


Amend Schedule2-NonResidentialEndUser Connection
    [Arguments]    ${CURRENT_STATUS_ACC}    ${ORI_OUTPUT_VALUE}
    Schedule2-NonResidentialEndUser.Amend Schedule2-NonResidentialEndUser Connection    ${CURRENT_STATUS_ACC}    ${ORI_OUTPUT_VALUE}
    


Get Excel Data
    [Arguments]    ${data_sheet_name}
    Open Excel    ${data_file}
    @{test_data_dictionary_list}=    Create List    
    ${ascii_sheet_name}    Evaluate    str(${data_sheet_name})
    Log     ${ascii_sheet_name}
    ${columnCount}    Get Column Count   ${ascii_sheet_name}
    ${rowCount}    Get Row Count     ${ascii_sheet_name}
    @{header_keys}=    Create List
    :FOR    ${rowIdx}    IN RANGE    1    ${rowCount}    
    \    &{test_data_dictionary}=    Prepare data dictionary    ${rowIdx}    ${ascii_sheet_name}
    \    Append to List    ${test_data_dictionary_list}    ${test_data_dictionary}
    [Return]    @{test_data_dictionary_list}
    
Prepare data dictionary
    [Arguments]    ${rowIdx}    ${data_sheet_name}
    Log    ${rowIdx}
    &{test_data_dictionary}=    Create Dictionary
    ${columnCount}    Get Column Count    ${data_sheet_name}
    :FOR    ${columnIdx}    IN RANGE    1    ${columnCount} 
    \    ${key}    Read Cell Data By Coordinates    ${data_sheet_name}    ${columnIdx}    0
    \    ${value}    Read Cell Data By Coordinates    ${data_sheet_name}    ${columnIdx}    ${rowIdx}
    \    Set To Dictionary    ${test_data_dictionary}    ${key}    ${value}
    [Return]    ${test_data_dictionary}
