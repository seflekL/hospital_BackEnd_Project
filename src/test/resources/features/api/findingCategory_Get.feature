Feature: As an administrator (admin) I should be able to access the finding category list via API connection


  Scenario: TC095[US0309API] Validate api/getFindingCategory API Response

    Given The api user prepares a valid GET request to the "api/getFindingCategory" endpoint with proper authorization
    When The api user sends the GET request and saves the response
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

  Scenario Outline: TC096 [US030API] Validate employee details in the response body

    Given The api user sets "api/getFindingCategoryById" path parameters
    And The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    When The api user sends a GET body and saves the returned response.
    And The api user verifies that the findingCategoryById response body contains "<id>", "<category>" and "<created_at>"
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"
    Examples:
      | id | category              | created_at          |
      | 1  | Updated Category Name | 2024-12-27 09:01:35 |

  Scenario Outline: TC097 [US030API] Validate employee details in the response body

    Given The api user sets "api/getFindingCategoryById" path parameters
    And The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    When The api user sends a GET body and saves the returned response.
    And The api user verifies that the findingCategoryById response body contains "<id>", "<category>" and "<created_at>"
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"
    Examples:
      | id | category              | created_at          |
      | 1  | Updated Category Name | 2024-12-27 09:01:35 |

  Scenario: TC097[US030API] /api/getBloodGroup endpoint with Invalid Token information, and it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error."

    Given The api user prepares a valid GET request to the "api/getFindingCategory" endpoint with proper authorization
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
