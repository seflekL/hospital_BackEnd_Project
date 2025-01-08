@smoke
Feature: As an administrator (admin) I want to be able to create a new finding category record via API connection.


  Scenario Outline:TC0102[US031API] Code 200 Validate successful addition of a findingCategory

    Given The api user sets "api/addFindingCategory" path parameters.
    And The api user prepares  Json POST request containing "<category>"and "<created_at>" information to send to the api's endpoint.
    When api user sends a Json POST request and saves the returned response.
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | category         | created_at          |
      | QA Tester Levent | 2023-10-25 02:19:41 |

  Scenario Outline:TC0103 [US031API]Code 203Validate handling of HTTP response code 203 during findingCategory addition
    Given The api user sets "api/addFindingCategory" path parameters.
     And The api user prepares  fakeJson POST request containing "<categoryy>"and "<created_att>" information to send to the api's endpoint.
     When api user sends a Json POST request and saves the returned response.
    Then The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data."


    Examples:
      | categoryy         | created_att          |
      | QA Tester Levent | 2023-10-25 02:19:41 |

  Scenario Outline:TC0104 [US031API] Code 403 Invalid Token - Validate Handling of Invalid Token During findingCategory Addition
    Given The api user sets "api/addFindingCategory" path parameters.
    And The api user prepares Fake notice Json POST request containing "<typee>","<titlee>","<description>"and "<slug>" information to send to the api's endpoint.
    When api user sends a Json POST request and saves the returned response.
    Then The api user verifies that the status code is 403
    And The api user verifies that the "message" information in the response body is "You do not have authorization or token error"

    Examples:
      | typee  | titlee           | description                                                                                 | slug                   |
      | Notice | QA Tester Levent | Please dont ask our doctors to tell jokes; theyre better at surgeries than stand-up comedy. | laughter-best-medicine |

  Scenario Outline:TC0105[US031API] The creation of the  NoticeById record to be created via the API must be verified via the API.

    Given The api user sets "api/getFindingCategoryById" path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    And The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | id  |
      | 428 |
