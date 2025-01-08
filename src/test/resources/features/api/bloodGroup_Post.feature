@smoke
Feature: As an administrator (admin) I would like to be able to create a new blood group via API connection.


  Scenario Outline:TC053[US016API] Code 200 Validate successful addition of a blood group
    Given The api user sets "api/addBloodGroup" path parameters.
    And The api user prepares bloodGroup Json POST request containing "<name>","<is_blood_group>" information to send to the api's endpoint.
    When api user sends a Json POST request and saves the returned response.
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | name               | is_blood_group |
      | QAtester Kan Grubu | 7              |

  Scenario Outline:TC054 [US016API]Code 203Validate handling of HTTP response code 203 during blood group addition
    Given The api user sets "api/addBloodGroup" path parameters.
    And The api user prepares a false bloodGroupcode Json POST request containing "<namee>","<is_blood_group>" information to send to the api's endpoint.
    When api user sends a Json POST request and saves the returned response.
    Then The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data."

    Examples:
      | namee              | is_blood_group |
      | QAtester Kan Grubu | 7              |

  Scenario Outline:TC055 [US016API] Code 403 Invalid Token - Validate Handling of Invalid Token During Blood Group Addition
    Given The api user sets "api/addBloodGroup" path parameters.
    And The api user prepares a false bloodGroupcode Json POST request containing "<namee>","<is_blood_group>" information to send to the api's endpoint.
    When api user sends a Json POST request and saves the returned response.
    Then The api user verifies that the status code is 403
    And The api user verifies that the "message" information in the response body is "You do not have authorization or token error"

    Examples:
      | namee              | is_blood_group |
      | QAtester Kan Grubu | 7              |

  Scenario Outline:TC055[US016API] The creation of the new visitor purpose record to be created via the API must be verified via the API.

    Given The api user sets "api/visitorsId" path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    And The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | id  |
      | 756 |
