
Feature: As an administrator (admin), I should be able to update the announcement information registered in the system via API connection.

  Scenario Outline:TC0105[US032API]Code 200 Validate successful update of api/updateFindingCategory
    Given The api user sets "api/updateFindingCategory" path parameters.
    And The api user prepares Updated findingCategory Json Patch request containing "<id>"and "<category>" information to send to the api's endpoint.
    And api user sends a Json PATCH request and saves the returned response.
    And The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | category         | id |
      | QA Tester Levent | 1  |

  Scenario Outline:TC0106[US032API]Test Code 203  False update of a findingCategory

    Given The api user sets "api/updateFindingCategory" path parameters.
    And The api user prepares Updated findingCategory Json Patch request containing "<id>"and "<category>" information to send to the api's endpoint.
    And api user sends a Json PATCH request and saves the returned response.
    And The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number."

    Examples:
      | category         | id   |
      | QA Tester Levent | 5551 |

  Scenario Outline:TC0107[US032API]Code 403 Invalid Token Test.

    Given The api user sets "api/updateFindingCategory" path parameters.
    And The api user prepares Updated findingCategory Json Patch request containing "<id>"and "<category>" information to send to the api's endpoint.
    Then The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

    Examples:
      | category         | id   |
      | QA Tester Levent | 5551 |

  Scenario Outline:TC0108[US033API] The creation of the new notice to be created via the API must be verified via the API.

    Given The api user sets "api/updateFindingCategory" path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    And The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | id |
      | 1  |

