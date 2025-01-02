Feature: As an administrator (admin), I should be able to access the STAFF List via API connection.
# Bir yönetici (admin) olarak, API bağlantısı yoluyla PERSONEL Listesine erişebilmeliyim.
@smoke
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
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.


  Scenario Outline:TC003[US001API] When a GET request is sent to /api/staffList endpoint with valid authorization information, the information (name, surname, employee_id) returned in the response body of id(<id>) should be verified.

    Given The api user sets "api/staffList" path parameters
    When The api user sends a GET request, saves the returned response, and verifies that the status code is 200
    Then The api user verifies that the response body contains "<dataIndex>", "<id>", "<name>", "<surname>", and "<employee_id>"

    Examples:
      | dataIndex | id | name   | surname | employee_id |
      | 1         | 2  | Sonia  | Bush    | 9002        |
      | 2         | 4  | Sansa  | Gomez   | 9008        |
      | 3         | 5  | Belina | Turner  | 9005        |




