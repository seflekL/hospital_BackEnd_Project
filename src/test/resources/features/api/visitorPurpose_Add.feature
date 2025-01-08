 Feature: As an administrator (admin) I want to be able to create a new visitor purpose record via API connection.

  Scenario Outline: TC016[US006API] - POST request to the "/api/visitorsPurposeAdd" endpoint with valid authorization and correct data
  should return a 200 status code, a response body with the message "Success," and the creation of the new visitor
  purpose record should be verified via a GET request to the "/api/visitorsPurposeId" endpoint using the "addId"
  from the response body.

    Given The api user sets "api/visitorsPurposeAdd" path parameters.
    And The api user prepares a POST request containing "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeAdd endpoint.
    When api user sends a POST request and saves the returned response.
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | visitors_purpose | description        |
      | deneme purpose   | deneme description |

  Scenario Outline: TC017[US006API] Attempt to add a visitors purpose with invalid authorization
    Given The api user sets "api/visitorsPurposeAdd" path parameters.
    And The api user prepares a POST request containing "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeAdd endpoint.
    When The api user sends a POST request and saves the returned response.
    Then The api user verifies that the status code is 403.
    And The api user verifies that the "message" information in the response body is "You do not have authorization or token error".

    Examples:
      | visitors_purpose | description        |
      | deneme purpose   | deneme description |


