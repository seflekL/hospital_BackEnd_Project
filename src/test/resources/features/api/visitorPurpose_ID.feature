@smoke
Feature: Valid Authorization - Data validation for /api/visitorsPurposeId endpoint

  Scenario Outline: : TC014[US005API] - When sending a GET request to /api/visitorsPurposeId with valid authorization, the response should return the correct data for the specified id.

    Given The api user sets "api/visitorsPurposeId" path parameters
     And The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeId endpoint.
     When The api user sends a GET body and saves the returned response.
     Then The api user verifies that the status code is 200
     And The api user verifies that the "message" information in the response body is "Success"
     And The api user verifies that the visitorsPurposeId response body contains "<id>", "<visitors_purpose>", "<description>", "<created_at>"

    Examples:
      | id | visitors_purpose | description        | created_at          |
      | 32 | deneme purpose   | deneme description | 2023-05-22 07:49:20 |

  Scenario Outline: TC015[US005API] - Invalid data or missing authorization for /api/visitorsPurposeId

    Given The api user sets "api/visitorsPurposeId" path parameters
     And The api user prepares a GET request containing the "<id>" information to send to the api visitorsPurposeId endpoint.
     When The api user sends a GET body and saves the returned response.
     Then The api user verifies that the status code is 203
     And The api user verifies that the "message" information in the response body is "No id or wrong id."

    Examples:
      | id       |
      |          |
      | invalid  |
      | 99999999 |

  Scenario: TC016[US005API] - Invalid Token for /api/visitorsPurposeID endpoint

    Given The api user sets "api/visitorsPurposeID" path parameters
     And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

  Scenario Outline:TC018[US006API] The creation of the new visitor purpose record to be created via the API must be verified via the API.

    Given The api user sets "api/visitorsPurposeId" path parameters.
     When The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
     And The api user sends a GET body and saves the returned response.
     Then The api user verifies that the status code is 200.
     And The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | id  |
      | 762 |

