Feature:As an administrator (admin), I should be able to access the relevant finding category data by entering id via API connection.

  Scenario Outline: TC098[US030API] Validate GET Request for Finding Category by ID

    Given The api user sets "api/getFindingCategoryById" path parameters
    And The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    When The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | id |
      | 1  |

  Scenario Outline:TC099[US020API] Validate FindingCategory details in the response body

    Given The api user sets "api/getFindingCategoryById" path parameters
    And The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    When The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200
    And The api user verifies that the findingCategory response body contains "<id>", "<category>", "<created_at>"and "<dataIndex>"
    And The api user verifies that the "message" information in the response body is "Success"
    Examples:
      | dataIndex | id | category              | created_at          |
      | 0         | 1  | Updated Category Name | 2024-12-27 09:01:35 |

  Scenario Outline:TC100 [US031API]Code 203 False FindingCategory  details in the response body

    Given The api user sets "api/getFindingCategoryById" path parameters
    And The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeId endpoint.
    When The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "No id or wrong id."

    Examples:
      | id   |
      | 9999 |

  Scenario: TC101[US031API] /api/getFindingCategoryByIdp endpoint with Invalid Token information, and it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error."

    Given The api user prepares a valid GET request to the "api/getFindingCategoryById" endpoint with proper authorization
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

