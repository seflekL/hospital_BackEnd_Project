@smoke
Feature: As an administrator (admin), I should be able to access the Visitor information of the user whose id is given through the API connection.

  Scenario Outline: : TC033[US010] - When sending a GET request to api/visitorsId with valid authorization, the response should return the correct data for the specified id.

    Given The api user sets "api/visitorsId" path parameters
    And The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeId endpoint.
    When The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"
    And The api user verifies that the visitorsID response body contains "<id>"

    Examples:
      | id |
      | 35 |

  Scenario Outline: TC034[US0010API] - Invalid data or missing authorization for /api/visitorsId

    Given The api user sets "api/visitorsId" path parameters
    And The api user prepares a GET request containing the "<id>" information to send to the api visitorsPurposeId endpoint.
    When The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "No id or wrong id."

    Examples:
      | id       |
      | invalid  |
      | 99999999 |

  Scenario: TC035[US010API] - Invalid Token for /api/visitorsId endpoint
    Given The api user sets "api/visitorsId" path parameters
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

  Scenario Outline: TC036[US010API] The creation of the new visitor purpose record to be created via the API must be verified via the API.

    Given The api user sets "api/visitorsId" path parameters.
    And The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeId endpoint.
    And The api user sends a GET body and saves the returned response.
    When The api user verifies visitorsID that the response body contains "<id>","<source>","<purpose>","<name>","<email>","<created_at>"
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | id | source | purpose                | name        | email                    | created_at          |
      | 35 | Online | NEW: Semrush Backlinks | Mike Arnold | no-replyAnnora@gmail.com | 2023-05-12 10:13:29 |



