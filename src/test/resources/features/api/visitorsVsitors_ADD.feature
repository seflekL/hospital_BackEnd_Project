@smoke
Feature: As an administrator (admin) I want to be able to create a new visitor record via API connection.

  Scenario Outline:TC037[US011API]As an administrator (admin) I want to be able to create a new visitor record via API connection.
    Given The api user sets "api/visitorsAdd" path parameters.
    And The api user prepares a Json POST request containing "<source>", "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", and "<note>" information to send to the api visitorsAdd endpoint.
    When api user sends a Json POST request and saves the returned response.
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | source | purpose | name            | email     | contact    | id_proof | visit_to    | ipd_opd_staff_id | related_to | no_of_pepple | date       | in_time  | out_time | note                       |
      | Online | Inquiry | Levent Burdaydi | niko@niko | 9638521770 | 0125856  | opd_patient | 7                | QA test    | 10           | 2023-10-05 | 09:30 PM | 10:30 PM | Data Base Duzgun calisiyor |


  Scenario Outline:TC038[US011API] Invalid Token Code 403 As an administrator (admin) I want to be able to create a new visitor record via API connection.
    Given The api user sets "api/visitorsAdd" path parameters.
    And The api user prepares a Json POST request containing "<source>", "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", and "<note>" information to send to the api visitorsAdd endpoint.
    When api user sends a Json POST request and saves the returned response.
    Then The api user verifies that the status code is 403
    And The api user verifies that the "message" information in the response body is "You do not have authorization or token error"

    Examples:
      | source | purpose | name            | email     | contact    | id_proof | visit_to    | ipd_opd_staff_id | related_to | no_of_pepple | date       | in_time  | out_time | note                       |
      | Online | Inquiry | Levent Burdaydi | niko@niko | 9638521770 | 0125856  | opd_patient | 7                | QA test    | 10           | 2023-10-05 | 09:30 PM | 10:30 PM | Data Base Duzgun calisiyor |

  Scenario Outline:TC039[US011API]Code 203 As an administrator (admin) I want to be able to create a new visitor record via API connection.
    Given The api user sets "api/visitorsAdd" path parameters.
    And The api user prepares a FAKE Json POST request containing "<fakeone>", "<fakeone2>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", and "<note>" information to send to the api visitorsAdd endpoint.
    When api user sends a Json POST request and saves the returned response.
    Then The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data."

    Examples:
      | fakeone | fakeone2 | name            | email     | contact    | id_proof | visit_to    | ipd_opd_staff_id | related_to | no_of_pepple | date       | in_time  | out_time  | note                       |
      | Online  | Inquiry  | Levent Burdaydi | niko@niko | 9638521770 | 0125856  | opd_patient | 7                | QA test    | 10           | 2023-10-05 | 09:30 PM | 10:30o PM | Data Base Duzgun calisiyor |

  Scenario Outline:TC040[US011API] The creation of the new visitor purpose record to be created via the API must be verified via the API.

    Given The api user sets "api/visitorsId" path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    And The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | id   |
      | 1396 |

