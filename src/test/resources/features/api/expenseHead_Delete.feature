Feature:As an administrator (admin) I should be able to delete the Expense Head record in the system via API connection.

  Scenario: TC092[US028API] A DELETE request to the "api/deleteExpenseHead" endpoint with valid authorization
  and correct data (id) should return a 200 status code, a response body message of "Success," and the "DeletedId" in the
  response should match the "id" in the request body.

    Given The api user sets "api/deleteExpenseHead" path parameters
    When The api user prepares a DELETE request to send to the api's endpoint with id 100
    Then The api user sends a DELETE request and saves the returned response.
    And The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"


  Scenario:TC092[US028] When a DELETE body containing valid authorization information and invalid data (id) is sent to the
  api/deleteExpenseHead endpoint, the status code returned is 203 and the message information in the response
  body is "No id or wrong id. Please check your id number." It should be verified that it is.

    Given The api user sets "api/deleteExpenseHead" path parameters
    When The api user prepares a DELETE request to send to the api's endpoint with id 100
    Then The api user sends a DELETE request and saves the returned response.
    And The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".


  Scenario:TC093[US028] Invalid Token When a DELETE body is sent to the api/deleteExpenseHead endpoint with invalid authorization information,
  it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error".

    Given The api user sets "api/deleteExpenseHead" path parameters
    When The api user prepares a DELETE request that does not contain data
    Then The api user sends a DELETE request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.


  Scenario:TC094[US028] It must be verified via the API that the visitor purpose record that is requested to be deleted via
  the API has been deleted.

    Given The api user sets "api/getExpenseHeadById" path parameters.
    Then The api user prepares a DELETE request to send to the api's endpoint with id 100
    And The api user sends a GET body and saves the returned response.
    And The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "No id or wrong id."



