Feature: Valid Authorization - Data validation for /api/visitorsPurposeId endpoint

  Scenario Outline:TC010 [US004API]When sending a GET body with valid authorization information and correct data (id) to the /api/visitorsPurposeId endpoint, it should be verified that the status code returned is 200 and the message information in the response body is "Success".

    Given The api user sets "api/visitorsPurposeList" path parameters
    # Api kullanıcısı "api/visitorsPurposeId" path parametrelerini oluşturur
    And The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    # Api kullanıcısı api visitorsPurposeId endpoint'ine göndermek için <id> bilgisini içeren bir GET request hazırlar
    When The api user sends a GET body and saves the returned response.
    # Api kullanıcısı GET request'i gönderir ve dönen yanıtı kaydeder
    Then The api user verifies that the status code is 200
    # Api kullanıcısı status code'un 200 olduğunu doğrular
    And The api user verifies that the "message" information in the response body is "Success"
    # Api kullanıcısı response body'deki "message" bilgisinin "Success" olduğunu doğrular
    And The api user verifies that the visitorPurpose response body contains "<id>", "<visitors_purpose>", "<description>", "<created_at>"
    # Api kullanıcısı response body'deki "<id>", "<visitors_purpose>", "<description>" ve "<created_at>" bilgilerini doğrular

    Examples:
      | id   | visitors_purpose | description                                        | created_at          |
      | 32   | deneme purpose   | deneme description                                 | 2023-05-22 07:49:20 |
      | 1036 | Ziyaret Saati    | Hastanede yatan yakınımı ziyaret etmek için geldim | 2024-12-25 21:04:51 |

  Scenario: TC011[US004API] - Invalid Token for /api/visitorsPurposeList endpoint
  # TC011[US004API] - /api/visitorsPurposeList endpoint'i için geçersiz token doğrulaması

    Given The api user sets "api/visitorsPurposeList" path parameters
    # Api kullanıcısı "api/visitorsPurposeId" path parametrelerini oluşturur
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanıcısı GET request gönderir, dönen yanıtı kaydeder ve status kodunun '403' ve reason phrase bilgisinin 'Forbidden' olduğunu doğrular.

  Scenario Outline: : TC012[US004API] - When sending a GET request to /api/opdList with valid authorization, the response should return the correct data for the specified id.
  # TC012[US004API] - /api/visitorsPurposeList endpoint'i için geçersiz token doğrulaması

    Given The api user sets "api/visitorsPurposeList" path parameters
    # Api kullanıcısı "api/visitorsPurposeId" path parametrelerini oluşturur
    And The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeList endpoint.
    # Api kullanıcısı api visitorsPurposeId endpoint'ine göndermek için <id> bilgisini içeren bir GET request hazırlar
    When The api user sends a GET body and saves the returned response.
    # Api kullanıcısı GET request'i gönderir ve dönen yanıtı kaydeder
    Then The api user verifies that the status code is 200
    # Api kullanıcısı status code'un 200 olduğunu doğrular
    And The api user verifies that the "message" information in the response body is "Success"
    # Api kullanıcısı response body'deki "message" bilgisinin "Success" olduğunu doğrular
    And The api user verifies that the visitorList response body contains "<id>", "<visitors_purpose>", "<description>", "<created_at>"
    # Api kullanıcısı response body'deki "<id>", "<visitors_purpose>", "<description>" ve "<created_at>" bilgilerini doğrular

    Examples:
      | id | visitors_purpose | description        | created_at          |
      | 32 | deneme purpose   | deneme description | 2023-05-22 07:49:20 |


  Scenario Outline: : TC014[US005API] - When sending a GET request to /api/visitorsPurposeId with valid authorization, the response should return the correct data for the specified id.
     # TC013[US004API] - /api/visitorsPurposeId endpoint'i

    Given The api user sets "api/visitorsPurposeId" path parameters
    # Api kullanıcısı "api/visitorsPurposeId" path parametrelerini oluşturur
    And The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeId endpoint.
    # Api kullanıcısı api visitorsPurposeId endpoint'ine göndermek için <id> bilgisini içeren bir GET request hazırlar
    When The api user sends a GET body and saves the returned response.
    # Api kullanıcısı GET request'i gönderir ve dönen yanıtı kaydeder
    Then The api user verifies that the status code is 200
    # Api kullanıcısı status code'un 200 olduğunu doğrular
    And The api user verifies that the "message" information in the response body is "Success"
    # Api kullanıcısı response body'deki "message" bilgisinin "Success" olduğunu doğrular
    And The api user verifies that the visitorsPurposeId response body contains "<id>", "<visitors_purpose>", "<description>", "<created_at>"
    # Api kullanıcısı response body'deki "<id>", "<visitors_purpose>", "<description>" ve "<created_at>" bilgilerini doğrular

    Examples:
      | id | visitors_purpose | description        | created_at          |
      | 32 | deneme purpose   | deneme description | 2023-05-22 07:49:20 |

  Scenario Outline: TC014[US005API] - Invalid data or missing authorization for /api/visitorsPurposeId
# TC014[US005API] - Geçersiz veri (id) veya eksik yetkilendirme ile /api/visitorsPurposeId endpoint doğrulaması.

    Given The api user sets "api/visitorsPurposeId" path parameters
  # Api kullanıcısı "api/visitorsPurposeId" path parametrelerini oluşturur.
    And The api user prepares a GET request containing the "<id>" information to send to the api visitorsPurposeId endpoint.
  # Api kullanıcısı geçersiz yetkilendirme bilgileri veya id içermeyen bir GET isteği hazırlar.
    When The api user sends a GET body and saves the returned response.
  # Api kullanıcısı GET isteğini gönderir ve dönen yanıtı kaydeder.
    Then The api user verifies that the status code is 203
  # Api kullanıcısı status kodunun 203 olduğunu doğrular.
    And The api user verifies that the "message" information in the response body is "No id or wrong id."
  # Api kullanıcısı response body'deki "message" bilgisinin "No id or wrong id." olduğunu doğrular.

    Examples:
      | id       |
      |          |
      | invalid  |
      | 99999999 |

  Scenario: TC015[US005API] - Invalid Token for /api/visitorsPurposeID endpoint
  # TC015[US005API] - /api/visitorsPurposeID endpoint'i için geçersiz token doğrulaması

    Given The api user sets "api/visitorsPurposeID" path parameters
    # Api kullanıcısı "api/visitorsPurposeId" path parametrelerini oluşturur
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanıcısı GET request gönderir, dönen yanıtı kaydeder ve status kodunun '403' ve reason phrase bilgisinin 'Forbidden' olduğunu doğrular.

  Scenario Outline: TC016[US006API] - POST request to the "/api/visitorsPurposeAdd" endpoint with valid authorization and correct data
  should return a 200 status code, a response body with the message "Success," and the creation of the new visitor
  purpose record should be verified via a GET request to the "/api/visitorsPurposeId" endpoint using the "addId"
  from the response body.

    Given The api user sets "api/visitorsPurposeAdd" path parameters.
  # Api kullanıcısı geçerli yetkilendirme bilgileriyle "api/visitorsPurposeAdd" endpointine gönderilecek bir POST isteği hazırlar.
    And The api user prepares a POST request containing "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeAdd endpoint.
  # Api kullanıcısı POST isteği gövdesine "<visitors_purpose>" ve "<description>" bilgilerini ekler.
    When api user sends a POST request and saves the returned response.
  # Api kullanıcısı POST isteğini gönderir ve dönen yanıtı kaydeder.
    Then The api user verifies that the status code is 200
  # Api kullanıcısı status kodunun 200 olduğunu doğrular.
    And The api user verifies that the "message" information in the response body is "Success"
  # Api kullanıcısı response body'deki "message" bilgisinin "Success" olduğunu doğrular.

    Examples:
      | visitors_purpose | description        |
      | deneme purpose   | deneme description |

  Scenario Outline: TC017[US006API] Attempt to add a visitors purpose with invalid authorization
    Given The api user sets "api/visitorsPurposeAdd" path parameters.
    # API kullanıcısı "api/visitorsPurposeAdd" path parametrelerini oluşturur
    And The api user prepares a POST request containing "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeAdd endpoint.
    # API kullanıcısı "<visitors_purpose>" ve "<description>" bilgilerini içeren bir POST request hazırlar
    When The api user sends a POST request and saves the returned response.
    # API kullanıcısı POST request gönderir
    Then The api user verifies that the status code is 403.
    # API kullanıcısı status code'un 403 olduğunu doğrular
    And The api user verifies that the "message" information in the response body is "You do not have authorization or token error".
    # API kullanıcısı response body'deki message bilgisinin "You do not have authorization or token error" olduğunu doğrular

    Examples:
      | visitors_purpose | description        |
      | deneme purpose   | deneme description |

  Scenario Outline:TC018[US006API] The creation of the new visitor purpose record to be created via the API must be verified via the API.

    Given The api user sets "api/visitorsPurposeId" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    When The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    And The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    And The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | id  |
      | 762 |

  Scenario Outline:TC019[US007] A PATCH request to the "/api/visitorsPurposeUpdate" endpoint with valid authorization and correct
  data (id, visitors_purpose, description) should return a 200 status code, a response body message of "Success," and
  the "updateId" in the response should match the "id" in the request body. The update should be confirmed via a GET
  request to the "/api/visitorsPurposeId" endpoint using the "updateId" from the response.

    Given The api user sets "api/visitorsPurposeUpdate" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    When The api user prepares a PATCH request containing <id>, "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeUpdate endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    And The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    And The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    And The api user verifies that the updateid information in the Response body is the same as the id information in the patch request body.
    # Api kullanıcısı Response body icindeki updateId bilgisinin patch request body icindeki id bilgisi ile ayni oldugunu dogrular

    Examples:
      | id  | visitors_purpose  | description                                                         |
      | 766 | Medical Follow-Up | Visiting the hospital for a scheduled medical follow-up appointment |

  Scenario Outline: TC019[US007] When a PATCH body (id, visitors_purpose, description) containing valid authorization information
  and invalid (id) is sent to the /api/visitorsPurposeUpdate endpoint, the status code returned is 203 and the message
  information in the response body is "Wrong information or missing information. Please check your input data and id
  number." should be verified.

    Given The api user sets "api/visitorsPurposeUpdate" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    When The api user prepares a PATCH request containing <id>, "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeUpdate endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    And The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    And The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular

    Examples:
      | id    | visitors_purpose | description            |
      | 85692 | purpose update   | purpose update details |


  Scenario Outline:TC020[US007] When a PATCH body (visitors_purpose, description) that does not contain valid authorization
  information (id) is sent to the /api/visitorsPurposeUpdate endpoint, the status code returned is 203 and the
  message information in the response body is "Wrong information or missing information. Please check your input
  data and id number." It should be verified that it is.

    Given The api user sets "api/visitorsPurposeUpdate" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    When The api user prepares a PATCH request that does not contain an id but includes "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeUpdate endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin id içermeyen ama "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    And The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    And The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular

    Examples:
      | visitors_purpose | description            |
      | purpose update   | purpose update details |


  Scenario:TC021[US007] When a PATCH request that does not contain valid authorization information and data is sent to the
  /api/visitorsPurposeUpdate endpoint, the status code returned is 203 and the message information in the response
  body is "Wrong information or missing information. Please check your input data and id number."
  It should be verified that it is.

    Given The api user sets "api/visitorsPurposeUpdate" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    When The api user prepares a PATCH request that does not contain data.
    # Api kullanicisi data icermeyen bir patch request hazırlar
    And The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    And The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular


  Scenario Outline: Invalid Token When sending a PATCH body (id, visitors_purpose, description) with invalid authorization information
  to the /api/visitorsPurposeUpdate endpoint, it should be verified that the status code returned is 403 and the message
  in the response body is "You do not have authorization or token error".

    * The api user sets "api/visitorsPurposeUpdate" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <id>, "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeUpdate endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    * And The api user sends a PATCH request, saves the returned response, and verifies that the status code is 403 with the reason phrase Forbidden.



    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular

    Examples:
      | id  | visitors_purpose | description            |
      | 756 | purpose update   | purpose update details |



  Scenario Outline: It must be verified via the API that the visitor purpose record that you want to update via the API
  has been updated.

    Given The api user sets "api/visitorsPurposeId" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    When The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    And The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    Then The api user verifies that the "lists.visitors_purpose" information in the response body is "purpose update".
    # Api kullanicisi response bodydeki lists.visitors_purpose bilgisinin "purpose update" oldugunu dogrular

    Examples:
      | id  |
      | 766 |
