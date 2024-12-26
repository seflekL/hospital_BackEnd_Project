Feature: Valid Authorization - Data validation for /api/visitorsPurposeId endpoint

  Scenario Outline:TC010 [US004API]When sending a GET body with valid authorization information and correct data (id) to the /api/visitorsPurposeId endpoint, it should be verified that the status code returned is 200 and the message information in the response body is "Success".

    Given The api user sets "api/visitorsPurposeId" path parameters
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
