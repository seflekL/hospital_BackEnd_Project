Feature: As an administrator (admin) I want to be able to create a new visitor record via API connection.

  Scenario Outline:TC037[US011API]As an administrator (admin) I want to be able to create a new visitor record via API connection.
    Given The api user sets "api/visitorsAdd" path parameters.
  # Api kullanıcısı geçerli yetkilendirme bilgileriyle "api/visitorsPurposeAdd" endpointine gönderilecek bir POST isteği hazırlar.
    And The api user prepares a Json POST request containing "<source>", "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", and "<note>" information to send to the api visitorsAdd endpoint.
    # Api kullanıcısı POST isteği gövdesine "<source>", "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>" ve "<note>" bilgilerini ekler..
    When api user sends a Json POST request and saves the returned response.
  # Api kullanıcısı POST isteğini gönderir ve dönen yanıtı kaydeder.
    Then The api user verifies that the status code is 200
  # Api kullanıcısı status kodunun 200 olduğunu doğrular.
    And The api user verifies that the "message" information in the response body is "Success"
  # Api kullanıcısı response body'deki "message" bilgisinin "Success" olduğunu doğrular.

    Examples:
      | source | purpose | name            | email     | contact    | id_proof | visit_to    | ipd_opd_staff_id | related_to | no_of_pepple | date       | in_time  | out_time | note                       |
      | Online | Inquiry | Levent Burdaydi | niko@niko | 9638521770 | 0125856  | opd_patient | 7                | QA test    | 10           | 2023-10-05 | 09:30 PM | 10:30 PM | Data Base Duzgun calisiyor |


  Scenario Outline:TC038[US011API] Invalid Token Code 403 As an administrator (admin) I want to be able to create a new visitor record via API connection.
    Given The api user sets "api/visitorsAdd" path parameters.
  # Api kullanıcısı geçerli yetkilendirme bilgileriyle "api/visitorsPurposeAdd" endpointine gönderilecek bir POST isteği hazırlar.
    And The api user prepares a Json POST request containing "<source>", "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", and "<note>" information to send to the api visitorsAdd endpoint.
    # Api kullanıcısı POST isteği gövdesine "<source>", "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>" ve "<note>" bilgilerini ekler..
    When api user sends a Json POST request and saves the returned response.
  # Api kullanıcısı POST isteğini gönderir ve dönen yanıtı kaydeder.
    Then The api user verifies that the status code is 403
  # Api kullanıcısı status kodunun 403 olduğunu doğrular.
    And The api user verifies that the "message" information in the response body is "You do not have authorization or token error"
  # Api kullanıcısı response body'deki "message" bilgisinin "You do not have authorization or token error" olduğunu doğrular.

    Examples:
      | source | purpose | name            | email     | contact    | id_proof | visit_to    | ipd_opd_staff_id | related_to | no_of_pepple | date       | in_time  | out_time | note                       |
      | Online | Inquiry | Levent Burdaydi | niko@niko | 9638521770 | 0125856  | opd_patient | 7                | QA test    | 10           | 2023-10-05 | 09:30 PM | 10:30 PM | Data Base Duzgun calisiyor |

  Scenario Outline:TC039[US011API]Code 203 As an administrator (admin) I want to be able to create a new visitor record via API connection.
    Given The api user sets "api/visitorsAdd" path parameters.
  # Api kullanıcısı geçerli yetkilendirme bilgileriyle "api/visitorsPurposeAdd" endpointine gönderilecek bir POST isteği hazırlar.
    And The api user prepares a FAKE Json POST request containing "<fakeone>", "<fakeone2>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", and "<note>" information to send to the api visitorsAdd endpoint.
    # Api kullanıcısı POST isteği gövdesine "<fakeone1>", "<fakeone2>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>" ve "<note>" bilgilerini ekler..
    When api user sends a Json POST request and saves the returned response.
  # Api kullanıcısı POST isteğini gönderir ve dönen yanıtı kaydeder.
    Then The api user verifies that the status code is 203
  # Api kullanıcısı status kodunun 203 olduğunu doğrular.
    And The api user verifies that the "message" information in the response body is "No information or missing information. Please check your input data."
  # Api kullanıcısı response body'deki "message" bilgisinin "You do not have authorization or token error" olduğunu doğrular.

    Examples:
      | fakeone | fakeone2 | name            | email     | contact    | id_proof | visit_to    | ipd_opd_staff_id | related_to | no_of_pepple | date       | in_time  | out_time | note                       |
      | Online  | Inquiry  | Levent Burdaydi | niko@niko | 9638521770 | 0125856  | opd_patient | 7                | QA test    | 10           | 2023-10-05 | 09:30 PM | 10:30o PM | Data Base Duzgun calisiyor |

  Scenario Outline:TC040[US011API] The creation of the new visitor purpose record to be created via the API must be verified via the API.

    Given The api user sets "api/visitorsId" path parameters.
    # Api kullanicisi "api/visitorsId" path parametrelerini olusturur
    When The api user prepares a GET request containing the <id> information to send to the api's endpoint.
    # Api kullanicisi api api/visitorsId endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    And The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    And The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | id   |
      | 1396 |

