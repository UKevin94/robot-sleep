*** Settings ***
Resource            demo-xml-resources.robot
Documentation       Simple script to test Robot Framework with a suite containing a test skipped and one in success
Test Teardown       Delete Added User
Default Tags        noBDD


*** Variables ***
&{USER}        login=R2        password=D2
${NEWPASSWORD}     cinq


*** Test Cases ***
Execute Basic Tests With Suite Containing Skip
    Get First User City Name
    Get Second User Email  
    Get number of french users
    Get login of 2nd major user
    [Teardown]    NONE

Skipped test
    Skip
    [Teardown]    NONE

*** Keywords ***

Delete Added User
    Delete User
