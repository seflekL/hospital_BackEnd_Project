@smoke
Feature: As an administrator (admin) I should be able to access the finding category list via API connection


  Scenario: TC113[US034API] Validate api/getFinding API Response

    Given The api user prepares a valid GET request to the "api/getFinding" endpoint with proper authorization
    When The api user sends the GET request and saves the response
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"





  Scenario: TC0114[US030API] /api/getFinding endpoint with Invalid Token information, and it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error."

    Given The api user prepares a valid GET request to the "api/getFinding" endpoint with proper authorization
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
