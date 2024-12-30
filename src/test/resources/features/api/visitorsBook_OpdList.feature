Feature: As an administrator (admin) I should be able to access the OPD List via API connection.

  Scenario: TC004[US002API] - GET Valid authorization returns success for /api/opdList
    # TC001[US004API] - Geçerli yetkilendirme ile yapılan GET isteği, /api/opdList için başarı döndürmelidir.
    Given The api user prepares a valid GET request to the "api/opdList" endpoint with proper authorization
    # Api kullanıcısı geçerli authorization bilgileri ile "api/opdList" endpointine gönderilecek bir GET request hazırlar
    When The api user sends the GET request and saves the response
    # Api kullanıcısı GET request'i gönderir ve yanıtı kaydeder
    Then The api user verifies that the status code is 200
    # Api kullanıcısı status kodunun 200 olduğunu doğrular
    And The api user verifies that the "message" information in the response body is "Success"
    # Api kullanıcısı response body'deki "message" bilgisinin "Success" olduğunu doğrular


  Scenario:TC005[US002API] Invalid Token - Authorization validation for /api/opdList endpoint

    Given The api user prepares a valid GET request to the "api/opdList" endpoint with proper authorization
    # Api kullanıcısı geçerli bir GET request hazırlar ve "api/staffList" endpoint'ine doğru yetkilendirme ile gönderir.
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanıcısı GET request gönderir, dönen yanıtı kaydeder ve status kodunun '403' ve reason phrase bilgisinin 'Forbidden' olduğunu doğrular.

  Scenario Outline: TC006[US002API] When sending a GET request to /api/opdList with valid authorization, the response should return the correct data for the specified id.

    Given The api user sets "api/opdList" path parameters
    # Api kullanıcısı "api/opdList" path parametrelerini oluşturur

    When The api user sends a GET request, saves the returned response, and verifies that the status code is 200
    # Api kullanıcısı GET request'i gönderir, dönen response'u kaydeder ve status code'un 200 olduğunu doğrular

    Then The api user verifies that the response body contains "<dataIndex>", "<id>", "<patient_name>", "<patient_id>"
    # Api kullanıcısı response body'deki "<dataIndex>", "<id>", "<patient_name>", "<patient_id>" bilgilerini doğrular

    Examples:
      | dataIndex | id | patient_name  | patient_id |
      | 0         | 1  | John Smith    | 6          |
      | 1         | 5  | Aditya Namdeo | 5          |
      | 2         | 6  | Smith Marsh   | 10         |

