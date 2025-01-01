Feature: As an administrator (admin), I should be able to access the relevant blood data by entering the id through the API connection.

  Scenario Outline: : TC049[US015API] - When sending a GET request to /api/visitorsPurposeId with valid authorization, the response should return the correct data for the specified id.

    Given The api user sets "api/getBloodGroupById" path parameters
    And The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeId endpoint.
    When The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | id |
      | 1  |

  Scenario Outline: TC051 [US015API] Validate employee details in the response body

    Given The api user sets "api/getBloodGroupById" path parameters
    And The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    When The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200
    And The api user verifies that the bloodgroupbyID response body contains "<id>", "<name>", "<is_blood_group>", and "<created_at>"
    Examples:
      | id | name      | is_blood_group | created_at          |
      | 1  | DirtBlood | 0              | 2024-12-09 11:58:45 |

  Scenario Outline: TC052 [US015API] Code203 Test Validate employee details in the response body

    Given The api user sets "api/getBloodGroupById" path parameters
    When The api user sends a GET body and saves the returned response.
    And The api user verifies that the bloodgroupbyID response body contains "<id>", "<name>", "<is_blood_group>", and "<created_at>"
    Then The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "No id or wrong id."

    Examples:
      | id    | name      | is_blood_group | created_at          |
      | 99999 | DirtBlood | 0              | 2024-12-09 11:58:45 |

  Scenario Outline: : TC053[US015API] - Code403 Invalid Token Test When sending a GET request to /api/getBloodGroupById with valid authorization, the response should return the correct data for the specified id.

    Given The api user sets "api/getBloodGroupById" path parameters
    And The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    Examples:
      | id |
      | 1  |






