Feature: As an administrator (admin) I should be able to access the IPD List via API connection.

  Scenario: TC007[US003API] request is sent to the /api/ipdList endpoint with valid authorization, the response should return a 200 status code and the message "Success".
    Given The api user sets "api/ipdList" path parameters
    When The api user sends the GET request and saves the response
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"


  Scenario: TC008 [US003API] When a GET request is sent to the /api/ipdList endpoint with Invalid Token, the response should return a 403 status code and the message "You do not have authorization or token error."

    Given The api user prepares a valid GET request to the "api/ipdList" endpoint with proper authorization
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

  Scenario Outline: TC009 [US003API] When a GET request is sent to /api/ipdList endpoint with valid authorization, the information (patient_name, patient_id) returned in the response body of the specified id should be verified.

    Given The api user sets "api/ipdList" path parameters
    And The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    And The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success".
    And The api user verifies that the response body contains "<dataIndex>", "<id>", "<patient_name>", "<patient_id>"

    Examples:
      | dataIndex | id | patient_name  | patient_id |
      | 0         | 3  | Corium Olva   | 12         |
      | 1         | 6  | James Dev     | 3          |
      | 2         | 8  | John Marshall | 2          |



