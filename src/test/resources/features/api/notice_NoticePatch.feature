Feature: As an administrator (admin), I should be able to update the announcement information registered in the system via API connection.

  Scenario Outline:TC072[US022API]Code 200 Validate successful update of a api/updateNotice
    Given The api user sets "api/updateNotice" path parameters.
    And The api user prepares Updated notice Json POST request containing "<id>","<type>","<title>","<description>"and "<slug>" information to send to the api's endpoint.
    And api user sends a Json PATCH request and saves the returned response.
    And The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | id  | type   | title            | description                                                                                | slug                 |
      | 759 | Notice | QA Tester Levent | Updating the notice details for testing purposes. This change is made by QA Tester Levent. | notice-update-levent |

  Scenario Outline:TC073[US022API]Test Code 203  False update of a Notice

    Given The api user sets "api/updateNotice" path parameters.
    And The api user prepares Updated notice Json POST request containing "<id>","<type>","<title>","<description>"and "<slug>" information to send to the api's endpoint.
    And api user sends a Json PATCH request and saves the returned response.
    And The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number."

    Examples:
      | id      | type   | title            | description                                                                                | slug                 |
      | 7599999 | Notice | QA Tester Levent | Updating the notice details for testing purposes. This change is made by QA Tester Levent. | notice-update-levent |


  Scenario Outline:TC074[US022API]Code 403 Invalid Token Test.

    Given The api user sets "api/updateNotice" path parameters.
    And The api user prepares Updated notice Json POST request containing "<id>","<type>","<title>","<description>"and "<slug>" information to send to the api's endpoint.
    Then The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

    Examples:
      | id      | type   | title            | description                                                                                | slug                 |
      | 7599999 | Notice | QA Tester Levent | Updating the notice details for testing purposes. This change is made by QA Tester Levent. | notice-update-levent |


  Scenario Outline:TC074[US022API] The creation of the new notice to be created via the API must be verified via the API.

    Given The api user sets "api/getNoticeById" path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    And The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | id  |
      | 759 |

