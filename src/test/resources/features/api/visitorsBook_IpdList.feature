Feature: As an administrator (admin) I should be able to access the IPD List via API connection.

  Scenario: TC007[US003API] request is sent to the /api/ipdList endpoint with valid authorization, the response should return a 200 status code and the message "Success".
    Given The api user sets "api/ipdList" path parameters
    # Api kullanıcısı "api/ipdList" path parametrelerini oluşturur
    When The api user sends the GET request and saves the response
    # Api kullanıcısı GET request'i gönderir ve yanıtı kaydeder
    Then The api user verifies that the status code is 200
    # Api kullanıcısı status kodunun 200 olduğunu doğrular
    And The api user verifies that the "message" information in the response body is "Success"


  Scenario: TC008 [US003API] When a GET request is sent to the /api/ipdList endpoint with Invalid Token, the response should return a 403 status code and the message "You do not have authorization or token error."

    Given The api user prepares a valid GET request to the "api/ipdList" endpoint with proper authorization
    # Api kullanıcısı geçerli bir GET request hazırlar ve "api/staffList" endpoint'ine doğru yetkilendirme ile gönderir.
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanıcısı GET request gönderir, dönen yanıtı kaydeder ve status kodunun '403' ve reason phrase bilgisinin 'Forbidden' olduğunu doğrular.

  Scenario Outline: TC009 [US003API] When a GET request is sent to /api/ipdList endpoint with valid authorization, the information (patient_name, patient_id) returned in the response body of the specified id should be verified.

    Given The api user sets "api/ipdList" path parameters
    # Api kullanıcısı "api/ipdList" path parametrelerini oluşturur
    And The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    # Api kullanıcısı api visitorsPurposeid endpoint'ine göndermek için <id> bilgisini içeren bir GET request hazırlar
    And The api user sends a GET body and saves the returned response.
    # Api kullanıcısı GET request gönderir ve dönen yanıtı kaydeder
    Then The api user verifies that the status code is 200
    # Api kullanıcısı status code'un 200 olduğunu doğrular
    And The api user verifies that the "message" information in the response body is "Success".
    # Api kullanıcısı response body'deki "message" bilgisinin "Success" olduğunu doğrular
    And The api user verifies that the response body contains "<dataIndex>", "<id>", "<patient_name>", "<patient_id>"
    # Api kullanıcısı response body'deki "<dataIndex>", "<id>", "<patient_name>", "<patient_id>" bilgilerini doğrular

    Examples:
      | dataIndex | id | patient_name  | patient_id |
      | 0         | 3  | Corium Olva   | 12         |
      | 1         | 6  | James Dev     | 3          |
      | 2         | 8  | John Marshall | 2          |



