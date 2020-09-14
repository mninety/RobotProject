*** Settings *** 
Library    SeleniumLibrary    
Library    DateTime    
Library    Collections    
Suite Setup    Set Global Variable    ${url}    https://qa2.gim.com.bd/ejogajogAdmin/#/    
*** Keywords ***


*** Variables ***
#${url}            https://qa2.gim.com.bd/ejogajogAdmin/#/
${browser}        headlesschrome    #Chrome    #headlesschrome
${username}       mninety@gmail.com
${password}       Ninety02#
${loginurl}       login
${createtrip}     soc/create-trip
*** Test Cases ***
Login Test

    Open Browser    ${url}${loginurl}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Input Text    xpath=//input[@placeholder='Email']    ${username}    
    #Input Text    type=email    ${username}
    Input Password    xpath=//input[@placeholder='Password']    ${password}
    Click Button    id=action-login
    Sleep    5s
    #Close Browser            
    #Log    Hello World    
    
Create Trip Test

    Go To    ${url}${createtrip}
    Set Browser Implicit Wait    5
    Input Text    name=mobileNum    01160606001    
    Click Button   xpath=/html/body/app-root/app-layout/section/app-service-operation-center/app-create-trip/div[1]/div[2]/button    
    Click Button    xpath=//div[@class='input-group-append']/button   
    Click Element    xpath=//div[@tabindex='0']/div   
    
    ${date}=      Get Current Date      time_zone=local      exclude_millis=yes
    ${plus1hour}=      Add Time To Date      ${date}      1 hour
    ${futurehour}      Convert Date      ${plus1hour}      result_format=%H
    
    ${plus1minute}=      Add Time To Date      ${date}      2 minute
    ${futureminute}      Convert Date      ${plus1minute}      result_format=%M
    #Log To Console    ${futureminute}    
    

    Input Text    xpath=//input[@placeholder='HH']    ${futurehour}      
    Input Text    xpath=//input[@placeholder='MM']    ${futureminute}   
    
    Run Keyword If    '${futurehour}'=='12'    Click Button    xpath=/html/body/app-root/app-layout/section/app-service-operation-center/app-create-trip/div/div[2]/form/div/div[2]/div[1]/div[1]/div/div[3]/ngb-timepicker/fieldset/div/div[5]/button    

    #...    ELSE    Log To Console    I am in Else Statement
    
    Input Text    id=createPickUpCtrl    dhaka    
    Drag And Drop By Offset    id=createPickUpMap    50    50    
    Input Text    id=createDropOffCtrl    gazipur    
    Drag And Drop By Offset    id=createDropOffMap    50    80   
    Input Text    xpath=//input[@role='combobox']    Palm Oil   
    Click Element    xpath=//div[@role='option']  
    Scroll Element Into View    xpath=//div[@class='customer-details']
    Sleep    5s
    Click Button    xpath=//div[@class='d-flex']/button[2]    #/html/body/app-root/app-layout/section/app-service-operation-center/app-create-trip/div/div[2]/form/div/div[1]/div/div[1]/button[2]      
    Input Text    xpath=//input[@formcontrolname='expectedTripPrice']    1000    
    Input Text    xpath=//textarea[@formcontrolname='creationReason']    Trip approved by Admin
    Click Button    xpath=/html/body/ngb-modal-window/div/div/div[3]/button[1]        
    ${message}=    Get Text    id=toast-container    
    #Log To Console    ${message}    
    #Close Browser
    