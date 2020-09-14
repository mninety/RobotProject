*** Settings ***
Library    SeleniumLibrary    
#Suite Setup    Get Variable Value    ${url}    
*** Variables ***
${approvetrip}=    soc/trip-approval?page=1&size=10&tripStatus=PENDING    

*** Test Cases ***
Trip Approval
    ${baseurl}    Get Variable Value     ${url}
    Go To    ${baseurl}${approvetrip}
    Set Browser Implicit Wait    5
    Sleep    5s
    ${pendingcount}=     Get Text    class=box-title    
    Log To Console    PendingCount=${pendingcount}    
    Run Keyword If    '${pendingcount}'=='0'    Close Browser
        
    ...    ELSE    
    ...    Run Keywords
    ...    Click Button    xpath=//div[@class='flex-fill']/div/div/div/button[2]   
    ...    AND    Sleep    2s 
    ...    AND    Input Text    xpath=//input[@formcontrolname='expectedTripPrice']    1000    
    ...    AND    Input Text    xpath=//textarea[@formcontrolname='message']    Trip approved by Admin
    ...    AND    Click Button    xpath=//div[@class='modal-footer']/button[2]             
    ...    AND    Close Browser    