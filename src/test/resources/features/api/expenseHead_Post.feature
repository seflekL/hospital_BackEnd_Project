@smoke
Feature:As an administrator (admin) I want to be able to create a new Expense Head record via API connection.


  Scenario Outline: TC084[US026API] Code 200 Validate successful addition of a expensehed
    Given The api user sets "api/addExpenseHead" path parameters.
    And The api user prepares expenseHead Json POST request containing "<exp_category>", "<description>", "<is_active>", "<is_deleted>" information to send to the api's endpoint.
    When api user sends a Json POST request and saves the returned response.
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | exp_category         | description                         | is_active | is_deleted |
      | QA Tester stationary | QA Tester Levent stationary expense | yes       | no         |


  Scenario Outline:TC085 [US026API]Code 203Validate handling of HTTP response code 203 during expense head addition
    Given The api user sets "api/addExpenseHead" path parameters.
    And The api user prepares Fake expenseHead Json POST request containing "<exp_categoryy>", "<descriptionn>", "<is_active>", "<is_deleted>" information to send to the api's endpoint.
    When api user sends a Json POST request and saves the returned response.
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | exp_categoryy        | descriptionn                        | is_active | is_deleted |
      | QA Tester stationary | QA Tester Levent stationary expense | yes       | no         |


  Scenario Outline:TC086 [US026API] Code 403 Invalid Token - Validate Handling of Invalid expense Addition
    Given The api user sets "api/addExpenseHead" path parameters.
    Given The api user prepares a valid GET request to the "api/getExpenseHead" endpoint with proper authorization
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    And The api user prepares Fake expenseHead Json POST request containing "<exp_categoryy>", "<descriptionn>", "<is_active>", "<is_deleted>" information to send to the api's endpoint.


    Examples:
      | exp_categoryy        | descriptionn                        | is_active | is_deleted |
      | QA Tester stationary | QA Tester Levent stationary expense | yes       | no         |

  Scenario Outline:TC087 [US026API] The creation of the new visitor purpose record to be created via the API must be verified via the API.

    Given The api user sets "api/getExpenseHeadById " path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    And The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | id  |
      | 796 |
