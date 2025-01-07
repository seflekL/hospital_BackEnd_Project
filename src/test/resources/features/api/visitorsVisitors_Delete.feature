Feature: API Deleted Request Verification

  Scenario: TC043[US013API] Verify DELETE functionality
    Given The api user sets "api/visitorsDelete" path parameters
    When The api user prepares a DELETE request to send to the api visitorsPurposeDelete endpoint with id 1411
    Then The api user sends a DELETE request and saves the returned response.
    And The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

  Scenario: TC044[US013API] Code 203 Verify DELETE functionality
    Given The api user sets "api/visitorsDelete" path parameters
    When The api user prepares a DELETE request to send to the api visitorsPurposeDelete endpoint with id 1411
    Then The api user sends a DELETE request and saves the returned response.
    And The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number."

  Scenario: TC045[US013API] Code 403 Invalid Token Verify DELETE functionality
    Given The api user sets "api/visitorsDelete" path parameters
    And The api user sends a  request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

