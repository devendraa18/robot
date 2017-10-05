coding: ascii
*** Settings ***
Documentation    Schedule#1 Test Cases
Library    ExcelLibrary
Library    Collections
Library    FakerLibrary    locale=en_US   
Resource    ${CURDIR}${/}../../Resources/Common.robot    #setup and tear down
Resource    ${CURDIR}${/}../../Resources/PO/Schedule1-ResidentialEndUser.robot
Resource    ${CURDIR}${/}../../Resources/PO/ordering/components/Constants.robot
Test Setup    Common.Open SWP
Test Teardown    Common.Close SWP
Force Tags    regression
#Default Tags    sanity
Default Tags    onlysch

*** Variables ***
${data_file}    ${CURDIR}${/}/../../data/TestData.xls
@{data_set_list}=    Get Excel Data
${residential_provide_view_data_sheet}    'residential_provide_view'
${returned_ori}


*** Test Cases ***
# Set constant global variables

# Provide Schedule1-ResidentialEndUser Connection
    # [Tags]    onlysch
    # @{data_set_list}=    Get Excel Data    ${residential_provide_view_data_sheet}
    # :FOR    ${data_set}    IN    @{data_set_list} 
    # \    Log    ${data_set}
    # \    Provide Schedule1-ResidentialEndUser Connection    ${data_set}
   # # ${address}=    FakerLibrary.Address
   # # Log    ${address}
    # # &{data_set}=    Create Dictionary    
    # # ...    postal_code=111111    
    # # ...    unit_number=01-02    
    # # ...    coverage_status=Home Passed
    # # Provide Schedule1-ResidentialEndUser Connection    ${data_set}


Provide Schedule1-ResidentialEndUser Connection order submit
    [Tags]    onlysch
    #Set Global Variable    ${captured_ori_value}
    @{data_set_list}=    Get Excel Data    ${residential_provide_view_data_sheet}
    :FOR    ${data_set}    IN    @{data_set_list} 
    \    Log    ${data_set}
    \    Provide Schedule1-ResidentialEndUser Connection order submit    ${data_set}


# View Schedule1-ResidentialEndUser Connection
    # [Tags]    onlysch
    # #Set Global Variable    ${captured_ori_value}
    # # @{data_set_list}=    Get Excel Data    ${residential_provide_view_data_sheet}
    # # :FOR    ${data_set}    IN    @{data_set_list} 
    # # \    Log    ${data_set}
    # # \    View Schedule1-ResidentialEndUser Connection    ${data_set}
    # View Schedule1-ResidentialEndUser Connection    ${ORI_VALUE}
    
    
# Cancel Schedule1-ResidentialEndUser Connection
    # [Tags]    onlysch
    # @{data_set_list}=    Get Excel Data    ${residential_provide_view_data_sheet}
    # :FOR    ${data_set}    IN    @{data_set_list} 
    # \    Log    ${data_set}
    # \    Cancel Schedule1-ResidentialEndUser Connection    ${data_set}    ${ORI_VALUE}    
 

# Terminate Schedule1-ResidentialEndUser Connection
    # [Tags]    onlysch
    
    # # @{data_set_list}=    Get Excel Data    ${residential_provide_view_data_sheet}
    # # :FOR    ${data_set}    IN    @{data_set_list} 
    # # \    Log    ${data_set}
    # # \    Terminate Schedule1-ResidentialEndUser Connection    ${data_set}    ${ORI_VALUE}    
    # Terminate Schedule1-ResidentialEndUser Connection    ${ORI_OUTPUT_VALUE} 


# Amend Schedule1-ResidentialEndUser Connection
    # [Tags]    onlysch
    # # @{data_set_list}=    Get Excel Data    ${residential_provide_view_data_sheet}
    # # :FOR    ${data_set}    IN    @{data_set_list} 
    # # \    Log    ${data_set}
    # # \    Terminate Schedule1-ResidentialEndUser Connection    ${data_set}    ${ORI_VALUE}    
    # Amend Schedule1-ResidentialEndUser Connection    ${CURRENT_STATUS_ACC}    ${ORI_OUTPUT_VALUE} 
 
    
*** Keywords ***
# Set constant global variables
    # Conatants.Set constant global variables

Provide Schedule1-ResidentialEndUser Connection
    [Arguments]    ${data_set}
    Schedule1-ResidentialEndUser.Provide Schedule1-ResidentialEndUser Connection    ${data_set}


Provide Schedule1-ResidentialEndUser Connection order submit
    [Arguments]    ${data_set}
    ${returned_ori}=    Schedule1-ResidentialEndUser.Provide Schedule1-ResidentialEndUser Connection order submit   ${data_set}
    Set Suite Variable    ${ORI_VALUE}    ${returned_ori}
    Set Suite Variable    ${ORI_OUTPUT_VALUE}    01-01-07022017-101837-A
    Set Suite Variable    ${CURRENT_STATUS_ACC}    Accepted
    Set Suite Variable    ${CURRENT_STATUS_COMP}    Completed
    
View Schedule1-ResidentialEndUser Connection
    [Arguments]    ${returned_ori}
    Schedule1-ResidentialEndUser.View Schedule1-ResidentialEndUser Connection    ${returned_ori}
    

Cancel Schedule1-ResidentialEndUser Connection
    [Arguments]    ${data_set}    ${returned_ori}
    Schedule1-ResidentialEndUser.Cancel Schedule1-ResidentialEndUser Connection    ${data_set}    ${returned_ori}
    

Terminate Schedule1-ResidentialEndUser Connection
    [Arguments]    ${ORI_OUTPUT_VALUE}
    Schedule1-ResidentialEndUser.Terminate Schedule1-ResidentialEndUser Connection    ${ORI_OUTPUT_VALUE}


Amend Schedule1-ResidentialEndUser Connection
    [Arguments]    ${CURRENT_STATUS_ACC}    ${ORI_OUTPUT_VALUE}
    Schedule1-ResidentialEndUser.Amend Schedule1-ResidentialEndUser Connection    ${CURRENT_STATUS_ACC}    ${ORI_OUTPUT_VALUE}
    


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
