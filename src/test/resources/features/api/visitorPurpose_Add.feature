Feature: As an administrator (admin) I want to be able to create a new visitor purpose record via API connection.

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


