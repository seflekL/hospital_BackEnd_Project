@smoke
Feature: As an administrator (admin) I should be able to access the OPD List via API connection.


  Scenario: TC004[US002API] - GET Valid authorization returns success for /api/opdList
    Given The api user prepares a valid GET request to the "api/opdList" endpoint with proper authorization
    When The api user sends the GET request and saves the response
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"


  Scenario:TC005[US002API] Invalid Token - Authorization validation for /api/opdList endpoint

    Given The api user prepares a valid GET request to the "api/opdList" endpoint with proper authorization
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

  Scenario Outline: TC006[US002API] When sending a GET request to /api/opdList with valid authorization, the response should return the correct data for the specified id.

    Given The api user sets "api/opdList" path parameters

    When The api user sends a GET request, saves the returned response, and verifies that the status code is 200

    Then The api user verifies that the response body contains "<dataIndex>", "<id>", "<patient_name>", "<patient_id>"

    Examples:
      | dataIndex | id | patient_name  | patient_id |
      | 0         | 1  | John Smith    | 6          |
      | 1         | 5  | Aditya Namdeo | 5          |
      | 2         | 6  | Smith Marsh   | 10         |

