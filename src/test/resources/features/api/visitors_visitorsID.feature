Feature: As an administrator (admin), I should be able to access the Visitor information of the user whose id is given through the API connection.

  Scenario Outline: : TC033[US010] - When sending a GET request to api/visitorsId with valid authorization, the response should return the correct data for the specified id.
    # TC033[US010API] - /api/visitorsId endpoint'i

    Given The api user sets "api/visitorsId" path parameters
    # Api kullanıcısı "api/visitorsId" path parametrelerini oluşturur
    And The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeId endpoint.
    # Api kullanıcısı api visitorsPurposeId endpoint'ine göndermek için <id> bilgisini içeren bir GET request hazırlar
    When The api user sends a GET body and saves the returned response.
    # Api kullanıcısı GET request'i gönderir ve dönen yanıtı kaydeder
    Then The api user verifies that the status code is 200
    # Api kullanıcısı status code'un 200 olduğunu doğrular
    And The api user verifies that the "message" information in the response body is "Success"
    # Api kullanıcısı response body'deki "message" bilgisinin "Success" olduğunu doğrular
    And The api user verifies that the visitorsID response body contains "<id>"
    # Api kullanıcısı response body'deki "<id>"

    Examples:
      | id |
      | 35 |

  Scenario Outline: TC034[US0010API] - Invalid data or missing authorization for /api/visitorsId
# TC014[US005API] - Geçersiz veri (id) veya eksik yetkilendirme ile /api/visitorsPurposeId endpoint doğrulaması.

    Given The api user sets "api/visitorsId" path parameters
  # Api kullanıcısı "api/visitorsId" path parametrelerini oluşturur.
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
      | invalid  |
      | 99999999 |

  Scenario: TC035[US010API] - Invalid Token for /api/visitorsId endpoint
  # TC034[US010API] - /api/visitorsPurposeID endpoint'i için geçersiz token doğrulaması
    Given The api user sets "api/visitorsId" path parameters
    # Api kullanıcısı "api/visitorsId" path parametrelerini oluşturur
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanıcısı GET request gönderir, dönen yanıtı kaydeder ve status kodunun '403' ve reason phrase bilgisinin 'Forbidden' olduğunu doğrular.

  Scenario Outline: TC036[US010API] The creation of the new visitor purpose record to be created via the API must be verified via the API.

    Given The api user sets "api/visitorsId" path parameters.
    # Api kullanicisi "api/visitorsId" path parametrelerini olusturur
    And The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeId endpoint.
    # Api kullanıcısı, api visitorsPurposeId endpoint'ine göndermek için <id> bilgisini içeren bir GET request hazırlar.
    And The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    When The api user verifies visitorsID that the response body contains "<id>","<source>","<purpose>","<name>","<email>","<created_at>"
    # Api kullanıcısı response body'deki "<id>", "<name>", "<purpose>", "<source>", "<email>" ve "<created_at>" bilgilerini doğrular
    Then The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    And The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular

    Examples:
      | id  | source  | purpose                | name         | email                     | created_at           |
      | 35  | Online  | NEW: Semrush Backlinks | Mike Arnold  | no-replyAnnora@gmail.com  | 2023-05-12 10:13:29 |



