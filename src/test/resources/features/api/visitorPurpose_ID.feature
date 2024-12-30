Feature: Valid Authorization - Data validation for /api/visitorsPurposeId endpoint

  Scenario Outline: : TC014[US005API] - When sending a GET request to /api/visitorsPurposeId with valid authorization, the response should return the correct data for the specified id.
     # TC014[US004API] - /api/visitorsPurposeId endpoint'i

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

  Scenario Outline: TC015[US005API] - Invalid data or missing authorization for /api/visitorsPurposeId
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

  Scenario: TC016[US005API] - Invalid Token for /api/visitorsPurposeID endpoint
  # TC015[US005API] - /api/visitorsPurposeID endpoint'i için geçersiz token doğrulaması

    Given The api user sets "api/visitorsPurposeID" path parameters
    # Api kullanıcısı "api/visitorsPurposeId" path parametrelerini oluşturur
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanıcısı GET request gönderir, dönen yanıtı kaydeder ve status kodunun '403' ve reason phrase bilgisinin 'Forbidden' olduğunu doğrular.

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

