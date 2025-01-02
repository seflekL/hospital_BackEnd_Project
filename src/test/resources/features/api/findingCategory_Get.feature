Feature: As an administrator (admin) I should be able to access the finding category list via API connection..


  Scenario:TC095[US029API]Validate api/getFindingCategory API Response

    Given The api user prepares a valid GET request to the "api/getFindingCategory" endpoint with proper authorization
    When The api user sends the GET request and saves the response
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"


  Scenario Outline: TC096[US029API]Validate expense details in the response body

    Given The api user sets "api/getFindingCategory" path parameters
    And     And The api user prepares a GET request containing the <id> information to send to the api's endpoint.

    When The api user sends a GET body and saves the returned response.
    Then The api user verifies that the expenseHead response body contains  "<id>", "<exp_category>", "<is_active>", and "<created_at>"
    Then The api user verifies that the findingCategory response body contains  "<id>", "<category>", "<created_at>"
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"
##burda kaldim
    Examples:
      | id | category   created_at          |



  Scenario: TC080[US024API] /api/getExpenseHead endpoint with Invalid Token information, and it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error."

    Given The api user prepares a valid GET request to the "api/getExpenseHead" endpoint with proper authorization
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.


