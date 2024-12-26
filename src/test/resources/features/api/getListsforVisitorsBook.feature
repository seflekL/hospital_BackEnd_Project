Feature: As an administrator (admin), I should be able to access the STAFF List via API connection.
# Bir yönetici (admin) olarak, API bağlantısı yoluyla PERSONEL Listesine erişebilmeliyim.

  Scenario: TC001[US001API] - GET Valid authorization returns success for /api/staffList
  # TC001[US001API] - Geçerli yetkilendirme ile yapılan GET isteği, /api/staffList için başarı döndürmelidir.

    Given The api user prepares a valid GET request to the "api/staffList" endpoint with proper authorization
    # Api kullanıcısı geçerli authorization bilgileri ile "api/staffList" endpointine gönderilecek bir GET request hazırlar
    When The api user sends the GET request and saves the response
    # Api kullanıcısı GET request'i gönderir ve yanıtı kaydeder
    Then The api user verifies that the status code is 200
    # Api kullanıcısı status kodunun 200 olduğunu doğrular
    And The api user verifies that the "message" information in the response body is "Success"
    # Api kullanıcısı response body'deki "message" bilgisinin "Success" olduğunu doğrular


  Scenario: TC002[US001API] /api/staffList endpoint with Invalid Token information, and it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error."

    Given The api user prepares a valid GET request to the "api/staffList" endpoint with proper authorization
    # Api kullanıcısı geçerli bir GET request hazırlar ve "api/staffList" endpoint'ine doğru yetkilendirme ile gönderir.

    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanıcısı GET request gönderir, dönen yanıtı kaydeder ve status kodunun '403' ve reason phrase bilgisinin 'Forbidden' olduğunu doğrular.


  Scenario Outline:TC003[US001API] When a GET request is sent to /api/staffList endpoint with valid authorization information, the information (name, surname, employee_id) returned in the response body of id(<id>) should be verified.

    Given The api user sets "api/staffList" path parameters
    # Api kullanıcısı "api/staffList" path parametrelerini oluşturur

    When The api user sends a GET request, saves the returned response, and verifies that the status code is 200
    # Api kullanıcısı GET request gönderir, dönen yanıtı kaydeder ve status kodunun 200 olduğunu doğrular

    Then The api user verifies that the response body contains "<dataIndex>", "<id>", "<name>", "<surname>", and "<employee_id>"
    # Api kullanıcısı response body'deki "<dataindex>", "<id>", "<name>", "<surname>" ve "<employee_id>" bilgilerini doğrular

    Examples:
      | dataIndex | id | name   | surname | employee_id |
      | 1         | 2  | Sonia  | Bush    | 9002        |
      | 2         | 4  | Sansa  | Gomez   | 9008        |
      | 3         | 5  | Belina | Turner  | 9005        |


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



