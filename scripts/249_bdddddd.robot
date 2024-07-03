# Automation priority: null
# Test case importance: Low
*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_249_SETUP}	Get Variable Value	${TEST 249 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_249_SETUP is not None	${__TEST_249_SETUP}

Test Teardown
	${__TEST_249_TEARDOWN}	Get Variable Value	${TEST 249 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_249_TEARDOWN is not None	${__TEST_249_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
bdddddd
	[Setup]	Test Setup

	Given ceci est mon premier step
	When je regarde mon second step
	Then je vois mon dernier step

	[Teardown]	Test Teardown