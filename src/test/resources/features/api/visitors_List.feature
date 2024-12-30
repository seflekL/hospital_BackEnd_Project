Feature: As an administrator (admin) I should be able to access the Visitor List via API connection.

  Scenario: TC030[US009API] - GET Valid authorization returns success for /api/visitorsList
  # TC001[US001API] - Geçerli yetkilendirme ile yapılan GET isteği, /api/staffList için başarı döndürmelidir.

    Given The api user prepares a valid GET request to the "api/visitorsList" endpoint with proper authorization
    # Api kullanıcısı geçerli authorization bilgileri ile "api/visitorsList" endpointine gönderilecek bir GET request hazırlar
    When The api user sends the GET request and saves the response
    # Api kullanıcısı GET request'i gönderir ve yanıtı kaydeder
    Then The api user verifies that the status code is 200
    # Api kullanıcısı status kodunun 200 olduğunu doğrular
    And The api user verifies that the "message" information in the response body is "Success"
    # Api kullanıcısı response body'deki "message" bilgisinin "Success" olduğunu doğrular


  Scenario: TC031[US009API] /api/visitorsList endpoint with Invalid Token information, and it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error."

    Given The api user prepares a valid GET request to the "api/visitorsList" endpoint with proper authorization
    # Api kullanıcısı geçerli bir GET request hazırlar ve "api/visitorsList" endpoint'ine doğru yetkilendirme ile gönderir.
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanıcısı GET request gönderir, dönen yanıtı kaydeder ve status kodunun '403' ve reason phrase bilgisinin 'Forbidden' olduğunu doğrular.


  Scenario Outline:TC032[US009API] When a GET request is sent to /api/visitorsList endpoint with valid authorization information, the information (name, surname, employee_id) returned in the response body of id(<id>) should be verified.

    Given The api user sets "api/visitorsList" path parameters
    # Api kullanıcısı "api/visitorsList" path parametrelerini oluşturur
    When The api user sends a GET request, saves the returned response, and verifies that the status code is 200
    # Api kullanıcısı GET request gönderir, dönen yanıtı kaydeder ve status kodunun 200 olduğunu doğrular
    Then The api user verifies visitorsList that the response body contains "<dataIndex>", "<id>", "<name>", "<source>", and "<purpose>"
    # Api kullanıcısı response body'deki "<dataindex>", "<id>", "<name>", "<surname>" ve "<employee_id>" bilgilerini doğrular

    Examples:
      | dataIndex | id   | name             | source | purpose |
      | 0        | 1392 | Andra Carrington | Online | have a query   |


