Feature:As an administrator (admin), I want to be able to update the Expense Head information registered in the system via API connection.

  Scenario Outline:TC088[US027API]Code 200 Validate successful update of a expense

    Given The api user sets "api/updateExpenseHead" path parameters.
    And The api user prepares expense Json PATCH request containing "<id>","<exp_category>", "<description>", "<is_active>", "<is_deleted>" information to send to the api's endpoint.
    And api user sends a Json PATCH request and saves the returned response.
    And The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | id  | exp_category         | description                         | is_active | is_deleted |
      | 659 | QA Tester stationary | QA Tester Levent stationary expense | yes       | no         |

  Scenario Outline:TC089[US027API]Test Code 203  False update of a headExpense


    Given The api user sets "api/updateExpenseHead" path parameters.
    And The api user prepares Fake expense Json PATCH request containing "<idd>","<exp_categoryy>", "<description>", "<is_active>", "<is_deleted>" information to send to the api's endpoint.
    And api user sends a Json PATCH request and saves the returned response.
    And The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number."

    Examples:
      | idd  | exp_categoryy         | description                         | is_active | is_deleted |
      | 6599 | QA Tester stationary | QA Tester Levent stationary expense | yes       | no         |

  Scenario Outline:TC090[US027API]Code 403 Invalid Token Test.

    Given The api user sets "api/updateExpenseHead" path parameters.
    And The api user prepares Fake expense Json PATCH request containing "<idd>","<exp_categoryy>", "<description>", "<is_active>", "<is_deleted>" information to send to the api's endpoint.
    Then The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

    Examples:
      | idd  | exp_categoryy         | description                         | is_active | is_deleted |
      | 6599 | QA Tester stationary | QA Tester Levent stationary expense | yes       | no         |



  Scenario Outline:TC091[US027API] The creation of the new expensehead to be created via the API must be verified via the API.

    Given The api user sets "api/getExpenseHeadById" path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    And The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | id  |
      | 659 |

