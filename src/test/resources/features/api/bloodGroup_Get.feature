@smoke
Feature: As an administrator (admin) I should be able to access the list of blood types registered in the system via API connection.

  Scenario:TC046[US014API]Validate Blood Group API Response


    Given The api user prepares a valid GET request to the "api/getBloodGroup" endpoint with proper authorization
    When The api user sends the GET request and saves the response
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

  Scenario: TC047[US014API] /api/getBloodGroup endpoint with Invalid Token information, and it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error."

    Given The api user prepares a valid GET request to the "api/getBloodGroup" endpoint with proper authorization
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.


  Scenario Outline:TC048 [US014API] Validate employee details in the response body

    Given The api user sets "api/getBloodGroup" path parameters
    When The api user sends a GET request, saves the returned response, and verifies that the status code is 200
    Then The api user verifies that the bloodgroup response body contains "<dataIndex>", "<id>", "<name>", "<is_blood_group>", and "<created_at>"

    Examples:
      | dataIndex | id | name      | is_blood_group | created_at          |
      | 0         | 1  | DirtBlood | 0              | 2024-12-09 11:58:45 |
      | 1         | 2  | A+        | 1              | 2021-10-25 06:32:10 |



