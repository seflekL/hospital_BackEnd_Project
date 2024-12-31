Feature: As an administrator (admin), I should be able to update the visitor information registered in the system via API connection.

  Scenario Outline:TC041[US012API]As an administrator (admin) I want to be able to create a new visitor record via API connection.
    Given The api user sets "api/visitorsUpdate" path parameters.
  # Api kullanıcısı geçerli yetkilendirme bilgileriyle "api/visitorsUpdate" endpointine gönderilecek bir POST isteği hazırlar.
    And The api user prepares a Json PATCH request containing "<id>","<source>", "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", and "<note>" information to send to the api visitorsAdd endpoint.
    # Api kullanıcısı POST isteği gövdesine "<source>", "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>" ve "<note>" bilgilerini ekler..
    When api user sends a Json PATCH request and saves the returned response.
  # Api kullanıcısı POST isteğini gönderir ve dönen yanıtı kaydeder.
    Then The api user verifies that the status code is 200
  # Api kullanıcısı status kodunun 200 olduğunu doğrular.
    And The api user verifies that the "message" information in the response body is "Success"
  # Api kullanıcısı response body'deki "message" bilgisinin "Success" olduğunu doğrular.

    Examples:
      | id   | source | purpose | name            | email     | contact    | id_proof | visit_to    | ipd_opd_staff_id | related_to | no_of_pepple | date       | in_time  | out_time | note                                               |
      | 765 | Online | Inquiry | Levent Burdaydi | niko@niko | 9638521770 | 0125856  | opd_patient | 7                | QA test    | 10           | 2023-10-05 | 09:30 PM | 10:30 PM | Why did the doctor go broke? He lost his patience. |

  Scenario Outline:TC042[US012API]Code 203 As an administrator (admin) I want to be able to create a new visitor record via API connection.

    Given The api user sets "api/visitorsUpdate" path parameters.
  # Api kullanıcısı geçerli yetkilendirme bilgileriyle "api/visitorsUpdate" endpointine gönderilecek bir POST isteği hazırlar.
     And The api user prepares a Json FAKE PATCH request containing "<id>","<id2>", "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>", and "<note>" information to send to the api visitorsAdd endpoint.
    # Api kullanıcısı POST isteği gövdesine "<source>", "<purpose>", "<name>", "<email>", "<contact>", "<id_proof>", "<visit_to>", "<ipd_opd_staff_id>", "<related_to>", "<no_of_pepple>", "<date>", "<in_time>", "<out_time>" ve "<note>" bilgilerini ekler..
    When api user sends a Json PATCH request and saves the returned response.
  # Api kullanıcısı POST isteğini gönderir ve dönen yanıtı kaydeder.
    Then The api user verifies that the status code is 203
  # Api kullanıcısı status kodunun 203 olduğunu doğrular.
    And The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number."
  # Api kullanıcısı response body'deki "message" bilgisinin "Success" olduğunu doğrular.

    Examples:
      | id   | id2 | purpose | name            | email     | contact    | id_proof | visit_to    | ipd_opd_staff_id | related_to | no_of_pepple | date       | in_time  | out_time | note                                               |
      | 76500 | Online | Inquiry | Levent Burdaydi | niko@niko | 9638521770 | 0125856  | opd_patient | 7                | QA test    | 10           | 2023-10-05 | 09:30 PM | 10:30 PM | Why did the doctor go broke? He lost his patience. |

  Scenario Outline:TC043[US012API]Code 403 Invalid Token As an administrator (admin) I want to be able to create a new visitor record via API connection.

    Given The api user sets "api/visitorsUpdate" path parameters.
  # Api kullanıcısı geçerli yetkilendirme bilgileriyle "api/visitorsUpdate" endpointine gönderilecek bir POST isteği hazırlar.
    When The api user prepares a PATCH request containing <id>, "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeUpdate endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    Then The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular

    Examples:
      | id  | visitors_purpose | description            |
      | 756 | purpose update   | purpose update details |


  Scenario Outline:TC042[US012API] The creation of the new visitor purpose record to be created via the API must be verified via the API.

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
      | 765 |

