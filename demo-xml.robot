*** Settings ***
Resource            demo-xml-resources.robot
Documentation       Simple script to try Robot Framework on an xml file.
Test Teardown       Delete Added User
Default Tags        noBDD


*** Variables ***
&{USER}        login=R2        password=D2
${NEWPASSWORD}     cinq


*** Test Cases ***
Execute Basic Tests
    Get First User City Name
    Get Second User Email  
    Get number of french users
    Get login of 2nd major user
    [Teardown]    NONE
    
Add new user based on first user
    ${newUser} =        Create New User Base on User with id      1
    Add New User        ${newUser}
    Create New Users List
    [Teardown]    NONE

Reset password of 1st minor user
    ${id} =       Identify User
    Tag Modified Element        ${id}
    Delete Password             ${id}
    Set New Cypher              ${id}
    Set New Password            ${id}
    Save Last List
    [Teardown]

User changes his password
    [Tags]    BDD
    Given a user has valid credentials
    When he changes his password
    Then the password has been changed
    And the old password disappeared

Password 1ms
    [Tags]    BDD
    Given a user has valid credentials
    And wait one millisecond
    When he changes his password
    Then the password has been changed
    And the old password disappeared

Password 1s
    [Tags]    BDD
    Given a user has valid credentials
    And wait one second
    When he changes his password
    Then the password has been changed
    And the old password disappeared

Password 1m
    [Tags]    BDD
    Given a user has valid credentials
    And wait one minute
    When he changes his password
    Then the password has been changed
    And the old password disappeared

Password 1h
    [Tags]    BDD
    Given a user has valid credentials
    And wait one hour
    When he changes his password
    Then the password has been changed
    And the old password disappeared

*** Keywords ***
A user has valid credentials
    Create new user     &{USER}

He changes his password
    ${selectedUserId} =     Validate Credentials        &{USER}
    Change password         ${selectedUserId}           ${NEWPASSWORD}

The password has been changed
    New Password Exists

The old password disappeared
    Old password doesn't exist

Delete Added User
    Delete User

Wait one millisecond
    Sleep    1ms

Wait one second
    Sleep    1s

Wait one minute
    Sleep    1m

Wait one hour
    Sleep    1h