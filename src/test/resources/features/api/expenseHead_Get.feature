Feature: As an administrator (admin) I want to be able to create a new Expense Head record via API connection.


  Scenario:TC078[US024API]Validate api/getExpenseHead API Response


    Given The api user prepares a valid GET request to the "api/getExpenseHead" endpoint with proper authorization
    When The api user sends the GET request and saves the response
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"


  Scenario Outline: TC079[US024API]Validate expense details in the response body

    Given The api user sets "api/getExpenseHeadById" path parameters
    And The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    When The api user sends a GET body and saves the returned response.
    Then The api user verifies that the expenseHead response body contains  "<id>", "<exp_category>", "<is_active>", and "<created_at>"
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | id | exp_category  | is_active | created_at          |
      | 1  | Building rent | yes       | 2021-10-25 13:50:41 |


  Scenario: TC080[US024API] /api/getExpenseHead endpoint with Invalid Token information, and it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error."

    Given The api user prepares a valid GET request to the "api/getExpenseHead" endpoint with proper authorization
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.


