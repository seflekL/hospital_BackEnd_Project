Feature: As an administrator (admin), I should be able to access the relevant announcement data by entering id through the API connection.

  Scenario Outline:TC067[US020API]Validate GET Request for Visitor Purpose by ID
    Given The api user sets "api/getNoticeById" path parameters
    And The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    When The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | id  |
      | 795 |

  Scenario Outline:TC067 [US020API] Validate notice details in the response body

    Given The api user sets "api/getNoticeById" path parameters
    And The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    When The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200
    And The api user verifies that the Notice response body contains "<dataIndex>", "<id>", "<type>", "<slug>","<url>" and "<date>"

    Examples:
      | dataIndex | id  | type   | slug             | url  | date       |
      | 0         | 794 | notice | noticedeneme     | null | 2024-12-27 |
      | 1         | 795 | notice | new-announcement | null | 2024-12-27 |

  Scenario Outline:TC068 [US020API]Code 203 False notice details in the response body

    Given The api user sets "api/getNoticeById" path parameters
    And The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeId endpoint.
    When The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "No id or wrong id."

    Examples:
      | id   |
      | 9999 |

