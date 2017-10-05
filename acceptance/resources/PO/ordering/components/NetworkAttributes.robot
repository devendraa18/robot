*** Setting ***
Library    Selenium2Library
#Resource    ${CURDIR}${/}/ordering/components/Constants.robot
Resource    ${CURDIR}${/}../../../Common.robot


*** Variable ***
${network_attributes_header}    //div[@data-qa='netAttr_header']
${network_attributes_header_label}    //div[@data-qa='netAttr_header']/h2
${order_type_label}    //label[@data-qa='netAttr_orderType_label']
${order_type_value_label}    //label[@data-qa='netAttr_orderType_value']/input
${redundancy_ori_label}    //label[@data-qa='netAttr_redundancyORI_label']
${redundancy_ori_value_label}    //label[@data-qa='netAttr_redundancyORI_value']/input
${provide_internal_cabling_to_first_tp_label}    //label[@data-qa='netAttr_firstTP_cable_label']
${provide_internal_cabling_to_first_tp_value_label}    //label[@data-qa='netAttr_firstTP_cable_value']/input
${length_from_ingress_to_tp_label}    //label[@data-qa='netAttr_firstTP_length_label']
${length_from_ingress_to_tp_value_label}    //label[@data-qa='netAttr_firstTP_length_value']/input
${transmission_tie_cable_fibre_stand_identifier_label}    //label[@data-qa='netAttr_TTCFSI_label']
${transmission_tie_cable_fibre_stand_identifier_value_label}    //label[@data-qa='netAttr_TTCFSI_value']/input
${qp_fdf_transmission_tie_cable_port_label}    //label[@data-qa='netAttr_QPFDF_label']
${qp_fdf_transmission_tie_cable_port_value_label}    //label[@data-qa='netAttr_QPFDF_value']/input
${rl_fdf_transmission_tie_cable_port_label}    //label[@data-qa='netAttr_RL_FDF_Transmission_label']
${rl_fdf_transmission_tie_cable_port_value_label}    //input[@id='netAttr_RL_FDF_Transmission']
${location_of_tp_label}    //label[@data-qa='netAttr_TPLocation_label']
${location_of_tp_value_label}    //label[@data-qa='netAttr_TPLocation_value']/input
${ingress_point_label}    //label[@data-qa='netAttr_IP_label']
${ingress_point_value_label}    //label[@data-qa='netAttr_IP_value']/input
${co_site_label}    //label[@data-qa='netAttr_CO_label']
${co_site_value_label}    //label[@data-qa='netAttr_CO_value']/input
${ftp_port_label}    //label[@data-qa='netAttr_FTP_label']
${ftp_port_value_label}    //label[@data-qa='netAttr_FTP_value']/input
${uplink_order_reference_label}    //label[@data-qa='netAttr_UOR_label']
${uplink_order_reference_value_label}    //label[@data-qa='netAttr_UOR_value']/input


*** Keyword ***     
Verify 'Network Attributes' section
    Verify 'Network Attributes' section label and is collapsable
    Verify 'Order Type' label and its value label
    Verify 'Redundancy ORI' label and its value label
    Verify 'Provide internal cabling to First TP' label and its value label
    Verify 'Length from Ingress to TP (meters)' label and its value label
    Verify 'Transmission Tie Cable Fibre Strand Identifier' label and its value
    Verify 'QP FDF Transmission Tie Cable Port' label and its value label
    Verify 'Location of TP' label and its value label
    Verify 'Ingress Point' label and its value label
    Verify 'CO Site' label and its value label
    Verify 'FTP Port' label and its value label
    Verify 'Uplink Order Reference' label and its value label
    
    

Verify 'Network Attributes' section label and is collapsable
    Verify 'Network Attributes' section label
    Verify 'Network Attributes' section is collapsable

    
Verify 'Order Type' label and its value label
    Verify 'Order Type' label
    Verify 'Order Type' value lable
    
    
Verify 'Redundancy ORI' label and its value label
    Verify 'Redundancy ORI' label
    Verify 'Redundancy ORI' value label
    
    
Verify 'Provide internal cabling to First TP' label and its value label
    Verify 'Provide internal cabling to First TP' label
    Verify 'Provide internal cabling to First TP' value label
    
    
Verify 'Length from Ingress to TP (meters)' label and its value label
    Verify 'Length from Ingress to TP (meters)' label
    Verify 'Length from Ingress to TP (meters)' value label


Verify 'Transmission Tie Cable Fibre Strand Identifier' label and its value
    Verify 'Transmission Tie Cable Fibre Strand Identifier' label
    Verify 'Transmission Tie Cable Fibre Strand Identifier' value label
    
    
Verify 'QP FDF Transmission Tie Cable Port' label and its value label
    Verify 'QP FDF Transmission Tie Cable Port' label
    Verify 'QP FDF Transmission Tie Cable Port' value label

Verify 'RL FDF Transmission Tie Cable Port' label and its value label
    Verify 'RL FDF Transmission Tie Cable Port' label
    Verify 'RL FDF Transmission Tie Cable Port' value label
    
Verify 'Location of TP' label and its value label
    Verify 'Location of TP' label
    Verify 'Location of TP' value label
    
    
    
Verify 'Ingress Point' label and its value label
    Verify 'Ingress Point' label
    Verify 'Ingress Point' value label
    
    
Verify 'CO Site' label and its value label
    Verify 'CO Site' label
    Verify 'CO Site' value label
    
    
Verify 'FTP Port' label and its value label
    Verify 'FTP Port' label
    Verify 'FTP Port' value label
    
    
Verify 'Uplink Order Reference' label and its value label
    Verify 'Uplink Order Reference' label
    Verify 'Uplink Order Reference' value label
    
    
    
Verify 'Network Attributes' section label
    #Element Text Should Be    ${network_attributes_header_label}    Network Attributes
    Common.Verify field label    ${network_attributes_header_label}    Network Attributes
    
Verify 'Network Attributes' section is collapsable
    Element Should Be Visible    ${order_type_label} 
    Click Element    ${network_attributes_header}
    Wait Until Element Is Not Visible    ${order_type_label} 
    Element Should Not Be Visible    ${order_type_label} 
    Click Element    ${network_attributes_header}
    Wait Until Element Is Visible    ${order_type_label}
    Element Should Be Visible    ${order_type_label}
    
Verify 'Order Type' label
    Element Text Should Be    ${order_type_label}    Order Type
    Common.Verify field label    ${order_type_label}    Order Type
    
Verify 'Order Type' value lable
    ${order_type_value}=    Get Element Attribute    ${order_type_value_label}@value            
    Textfield Value Should Be      ${order_type_value}    Residential End User Connection   message='Value not Matched'
    #Element Text Should Be    ${order_type_value_label}    Residential End User Connection

    
Verify 'Redundancy ORI' label
    #Element Text Should Be    ${redundancy_ori_label}    Redundancy ORI
    Common.Verify field label    ${redundancy_ori_label}    Redundancy ORI

Verify 'Redundancy ORI' value label
    ${redundancy_ori_value}=    Get Element Attribute    ${redundancy_ori_value_label}@value            
    Textfield Value Should Be      ${redundancy_ori_value}    7273guydsd23   message='Value Matched'
    #Element Text Should Be    ${redundancy_ori_value_label}    7273guydsd23
    
Verify 'Provide internal cabling to First TP' label
    #Element Text Should Be    ${provide_internal_cabling_to_first_tp_label}    Provide internal cabling to First TP
    Common.Verify field label    ${provide_internal_cabling_to_first_tp_label}    Provide internal cabling to First TP        

Verify 'Provide internal cabling to First TP' value label
    ${pro_int_cab_value}=    Get Element Attribute    ${provide_internal_cabling_to_first_tp_value_label}@value            
    Textfield Value Should Be      ${pro_int_cab_value}    test   message='Value Matched'   
    #Element Text Should Be    ${provide_internal_cabling_to_first_tp_value_label}    test
    
Verify 'Length from Ingress to TP (meters)' label
    #Element Text Should Be    ${length_from_ingress_to_tp_label}    Length from Ingress to TP (meters)
    Common.Verify field label    ${length_from_ingress_to_tp_label}    Length from Ingress to TP (meters)    
    
Verify 'Length from Ingress to TP (meters)' value label
    ${len_ingress_value}=    Get Element Attribute    ${length_from_ingress_to_tp_value_label}@value            
    Textfield Value Should Be      ${len_ingress_value}    ?   message='Value Matched'    
    #Element Text Should Be    ${length_from_ingress_to_tp_value_label}    ?
  
Verify 'Transmission Tie Cable Fibre Strand Identifier' label
    #Element Text Should Be    ${transmission_tie_cable_fibre_stand_identifier_label}    Transmission Tie Cable Fibre Strand Identifier
    Common.Verify field label    ${transmission_tie_cable_fibre_stand_identifier_label}    Transmission Tie Cable Fibre Strand Identifier
    
Verify 'Transmission Tie Cable Fibre Strand Identifier' value label  
    ${trans_tie_value}=    Get Element Attribute    ${transmission_tie_cable_fibre_stand_identifier_value_label}@value            
    Textfield Value Should Be      ${trans_tie_value}    test   message='Value Matched'
    #Element Text Should Be    ${transmission_tie_cable_fibre_stand_identifier_value_label}    test
    
Verify 'QP FDF Transmission Tie Cable Port' label
    #Element Text Should Be    ${qp_fdf_transmission_tie_cable_port_label}    QP FDF Transmission Tie Cable Port
    Common.Verify field label    ${qp_fdf_transmission_tie_cable_port_label}    QP FDF Transmission Tie Cable Port
    
Verify 'QP FDF Transmission Tie Cable Port' value label 
    ${QP_FDF_trans_value}=    Get Element Attribute    ${qp_fdf_transmission_tie_cable_port_value_label}@value            
    Textfield Value Should Be      ${QP_FDF_trans_value}    test   message='Value Matched'  
    #Element Text Should Be    ${qp_fdf_transmission_tie_cable_port_label}    test

Verify 'RL FDF Transmission Tie Cable Port' label
    Common.Verify field label    ${rl_fdf_transmission_tie_cable_port_label}    RL FDF Transmission Tie Cable Port

Verify 'RL FDF Transmission Tie Cable Port' value label
    ${rl_FDF_trans_value}=    Get Element Attribute    ${rl_fdf_transmission_tie_cable_port_value_label}@value            
    Textfield Value Should Be      ${rl_FDF_trans_value}    test   message='Value Matched'
    

Verify 'Location of TP' label
    #Element Text Should Be    ${location_of_tp_label}    Location of TP
    Common.Verify field label    ${location_of_tp_label}    Location of TP
    
    
Verify 'Location of TP' value label
    ${location_tp_value}=    Get Element Attribute    ${location_of_tp_value_label}@value            
    Textfield Value Should Be      ${location_tp_value}    test   message='Value Matched'
    #Element Text Should Be    ${location_of_tp_value_label}   test
    
    
Verify 'Ingress Point' label
    #Element Text Should Be    ${ingress_point_label}    Ingress Point   
    Common.Verify field label    ${ingress_point_label}    Ingress Point
        
Verify 'Ingress Point' value label  
    ${ingress_point_value}=    Get Element Attribute    ${ingress_point_value_label}@value            
    Textfield Value Should Be      ${ingress_point_value}    ?   message='Value Matched' 
    #Element Text Should Be    ${ingress_point_value_label}    ?
    
Verify 'CO Site' label
    #Element Text Should Be    ${co_site_label}    CO Site    
    Common.Verify field label    ${co_site_label}    CO Site
    
Verify 'CO Site' value label  
    ${CO_site_value}=    Get Element Attribute    ${co_site_value_label}@value            
    Textfield Value Should Be      ${CO_site_value}    BD   message='Value Matched'
    #Element Text Should Be    ${co_site_value_label}    BD
       
Verify 'FTP Port' label
    #Element Text Should Be    ${ftp_port_label}    FTP Port
    Common.Verify field label    ${ftp_port_label}    FTP Port
    
Verify 'FTP Port' value label
    ${FTP_port_value}=    Get Element Attribute    ${ftp_port_value_label}@value            
    Textfield Value Should Be      ${FTP_port_value}    ?   message='Value Matched'
    #Element Text Should Be    ${ftp_port_value_label}    ?
    
Verify 'Uplink Order Reference' label
    #Element Text Should Be    ${uplink_order_reference_label}    Uplink Order Reference
    Common.Verify field label    ${uplink_order_reference_label}    Uplink Order Reference
    
Verify 'Uplink Order Reference' value label
    ${uplink_order_ref_value}=    Get Element Attribute    ${uplink_order_reference_value_label}@value            
    Textfield Value Should Be      ${uplink_order_ref_value}    ?   message='Value Matched'
    #Element Text Should Be    ${uplink_order_reference_value_label}    ?

#*************************************************************** Schedule2 view keywords ******************************************************************************

Verify sch2 View 'Order Type' label and its value label
    Verify 'Order Type' label
    Verify sch2 View 'Order Type' value lable
    
    
Verify sch2 View 'Order Type' value lable
    ${order_type_value}=    Get Element Attribute    ${order_type_value_label}@value            
    Textfield Value Should Be      ${order_type_value}    Non-Residential End User Connection   message='Value not Matched'
    #Element Text Should Be    ${order_type_value_label}    Residential End User Connection