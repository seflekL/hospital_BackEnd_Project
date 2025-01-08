
Feature: As an administrator (admin), I should be able to update the visitor information registered in the system via API connection.

  Scenario Outline:TC041[US012API]As an administrator (admin) I want to be able to create a new visitor record via API connection.
    Given The api user sets "api/visitorsUpdate" path parameters.
    And The api user prepares a Json PATCH request containing "<id>","<source>", "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", and "<note>" information to send to the api visitorsAdd endpoint.
    When api user sends a Json PATCH request and saves the returned response.
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

    Examples:
      | id  | source | purpose | name            | email     | contact    | id_proof | visit_to    | ipd_opd_staff_id | related_to | no_of_pepple | date       | in_time  | out_time | note                                               |
      | 765 | Online | Inquiry | Levent Burdaydi | niko@niko | 9638521770 | 0125856  | opd_patient | 7                | QA test    | 10           | 2023-10-05 | 09:30 PM | 10:30 PM | Why did the doctor go broke? He lost his patience. |

  Scenario Outline:TC042[US012API]Code 203 As an administrator (admin) I want to be able to create a new visitor record via API connection.

    Given The api user sets "api/visitorsUpdate" path parameters.
    And The api user prepares a Json FAKE PATCH request containing "<id>","<id2>", "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", and "<note>" information to send to the api visitorsAdd endpoint.
    When api user sends a Json PATCH request and saves the returned response.
    Then The api user verifies that the status code is 203
    And The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number."

    Examples:
      | id    | id2    | purpose | name            | email     | contact    | id_proof | visit_to    | ipd_opd_staff_id | related_to | no_of_pepple | date       | in_time  | out_time | note                                               |
      | 76500 | Online | Inquiry | Levent Burdaydi | niko@niko | 9638521770 | 0125856  | opd_patient | 7                | QA test    | 10           | 2023-10-05 | 09:30 PM | 10:30 PM | Why did the doctor go broke? He lost his patience. |

  Scenario Outline:TC043[US012API]Code 403 Invalid Token As an administrator (admin) I want to be able to create a new visitor record via API connection.

    Given The api user sets "api/visitorsUpdate" path parameters.
    When The api user prepares a PATCH request containing <id>, "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeUpdate endpoint.
    Then The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.

    Examples:
      | id  | visitors_purpose | description            |
      | 756 | purpose update   | purpose update details |


  Scenario Outline:TC042[US012API] The creation of the new visitor purpose record to be created via the API must be verified via the API.

    Given The api user sets "api/visitorsId" path parameters.
    When The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    And The api user sends a GET body and saves the returned response.
    Then The api user verifies that the status code is 200.
    And The api user verifies that the "message" information in the response body is "Success".

    Examples:
      | id  |
      | 765 |

