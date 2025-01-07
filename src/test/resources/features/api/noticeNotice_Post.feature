Feature: As an administrator (admin) I would like to be able to create a new notice via API connection.


  Scenario Outline:TC069[US021API] Code 200 Validate successful addition of a blood group

    Given The api user sets "api/addNotice" path parameters.
    And The api user prepares notice Json POST request containing "<type>","<title>","<description>"and "<slug>" information to send to the api's endpoint.
    When api user sends a Json POST request and saves the returned response.
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | type   | title            | description                                                                                 | slug                   |
      | Notice | QA Tester Levent | Please dont ask our doctors to tell jokes; theyre better at surgeries than stand-up comedy. | laughter-best-medicine |

  Scenario Outline:TC070 [US021API]Code 203Validate handling of HTTP response code 203 during blood group addition
    Given The api user sets "api/addNotice" path parameters.
    And The api user prepares Fake notice Json POST request containing "<typee>","<titlee>","<description>"and "<slug>" information to send to the api's endpoint.
    When api user sends a Json POST request and saves the returned response.
    Then The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data."

    Examples:
      | typee   | titlee            | description                                                                                 | slug                   |
      | Notice | QA Tester Levent | Please dont ask our doctors to tell jokes; theyre better at surgeries than stand-up comedy. | laughter-best-medicine |

  Scenario Outline:TC071 [US021API] Code 403 Invalid Token - Validate Handling of Invalid Token During api/addNotice Addition
    Given The api user sets "api/addNotice" path parameters.
    And The api user prepares Fake notice Json POST request containing "<typee>","<titlee>","<description>"and "<slug>" information to send to the api's endpoint.
    When api user sends a Json POST request and saves the returned response.
    Then The api user verifies that the status code is 403
    And The api user verifies that the "message" information in the response body is "You do not have authorization or token error"

    Examples:
      | typee   | titlee            | description                                                                                 | slug                   |
      | Notice | QA Tester Levent | Please dont ask our doctors to tell jokes; theyre better at surgeries than stand-up comedy. | laughter-best-medicine |

  Scenario Outline:TC071[US021API] The creation of the  NoticeById record to be created via the API must be verified via the API.

    Given The api user sets "api/getNoticeById" path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    And The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | id  |
      | 756 |
