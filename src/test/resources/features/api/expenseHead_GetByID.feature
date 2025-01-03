Feature: As an administrator (admin), I should be able to access the relevant Expense Head data by entering id via API connection.

  Scenario Outline:TC081[US025API]Validate GET Request for Visitor Purpose by ID
    Given The api user sets "api/getExpenseHeadById" path parameters
    And The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    When The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | id |
      | 1  |

  Scenario Outline: TC082 [US025API] Validate expense details in the response body
    Given The api user sets "api/getExpenseHeadById" path parameters
    And The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    When The api user sends a GET body and saves the returned response.
    Then The api user verifies that the expenseHead response body contains  "<id>", "<exp_category>", "<is_active>", and "<created_at>"
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | id | exp_category  | is_active | created_at          |
      | 1  | Building rent | yes       | 2021-10-25 13:50:41 |

  Scenario Outline:TC083 [US025API]Code 203 False notice details in the response body

    Given The api user sets "api/getExpenseHeadById" path parameters
    And The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    When The api user sends a GET body and saves the returned response.
    Then The api user verifies that the expenseHead response body contains  "<id>", "<exp_category>", "<is_active>", and "<created_at>"
    Then The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "No id or wrong id."

    Examples:
      | id    | exp_category  | is_active | created_at          |
      | 19999 | Building rent | yes       | 2021-10-25 13:50:41 |

  Scenario: TC084[US025API] /api/getExpenseHeadById endpoint with Invalid Token information, and it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error."

    Given The api user prepares a valid GET request to the "api/getExpenseHeadById" endpoint with proper authorization
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.



