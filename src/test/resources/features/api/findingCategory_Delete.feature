Feature: As an administrator (admin) I should be able to unregister the finding category registered in the system via API connection.

  Scenario: TC109[US033] A DELETE request to the "api/deleteNotice" endpoint with valid authorization
  and correct data (id) should return a 200 status code, a response body message of "Success," and the "DeletedId" in the
  response should match the "id" in the request body.

    Given The api user sets "api/deleteFindingCategory" path parameters
    When The api user prepares a DELETE request to send to the api's endpoint with id 1
    Then The api user sends a DELETE request and saves the returned response.
    And The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"


  Scenario:TC0110[US033] When a DELETE body containing valid authorization information and invalid data (id) is sent to the
  api/deleteFindingCategory endpoint, the status code returned is 203 and the message information in the response
  body is "No id or wrong id. Please check your id number." It should be verified that it is.

    Given The api user sets "api/deleteFindingCategory" path parameters
    When The api user prepares a DELETE request to send to the api's endpoint with id 1
    Then The api user sends a DELETE request and saves the returned response.
    And The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".


  Scenario:TC111[US033] Invalid Token When a DELETE body is sent to the api/deleteFindingCategory  endpoint with invalid authorization information,1
  it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error".

    Given The api user sets "api/deleteFindingCategory" path parameters
    When The api user prepares a DELETE request that does not contain data
    Then The api user sends a DELETE request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.


  Scenario:TC112[US033] It must be verified via the API that the visitor purpose record that is requested to be deleted via
  the API has been deleted.

    Given The api user sets "api/getFindingCategoryById" path parameters.
    Then The api user prepares a DELETE request to send to the api's endpoint with id 1
    And The api user sends a GET body and saves the returned response.
    And The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "No id or wrong id.".



