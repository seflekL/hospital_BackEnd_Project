@smoke
Feature:As an administrator (admin), I should be able to update the blood information registered in the system via API connection.

  Scenario Outline:TC056[US017API]Code 200 Validate successful update of a blood group
    Given The api user sets "api/addBloodGroup" path parameters.
    When The api user prepares bloodGroup Json PATCH request containing "<id>","<name>","<is_blood_group>" information to send to the api's endpoint.
    And api user sends a Json PATCH request and saves the returned response.
    And The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | id  | name               | is_blood_group |
      | 748 | QAtester Kan Grubu | 7              |

  Scenario Outline:TC057[US017API]Test Code 203  False update of a blood group

    Given The api user sets "api/addBloodGroup" path parameters.
    When The api user prepares a fake bloodGroup Json PATCH request containing "<idd>","<namee>","<is_blood_group>" information to send to the api's endpoint.
    And api user sends a Json PATCH request and saves the returned response.
    And The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data."

    Examples:
      | idd | namee              | is_blood_group |
      | 748 | QAtester Kan Grubu | 7              |

  Scenario Outline:TC058[US017API]Code 403 Invalid Token Test.

    Given The api user sets "api/addBloodGroup" path parameters.
    When The api user prepares a fake bloodGroup Json PATCH request containing "<idd>","<namee>","<is_blood_group>" information to send to the api's endpoint.
    Then The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

    Examples:
      | idd | namee              | is_blood_group |
      | 748 | QAtester Kan Grubu | 7              |


  Scenario Outline:TC059[US017API] The creation of the new bloodGruop to be created via the API must be verified via the API.

    Given The api user sets "api/getBloodGroupById" path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    And The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | id  |
      | 745 |

