Feature: As an administrator (admin) I should be able to delete the visitor puspose record in the system via API connection.

  Scenario: TC024[US008] A DELETE request to the "/api/visitorsPurposeDelete" endpoint with valid authorization
  and correct data (id) should return a 200 status code, a response body message of "Success," and the "DeletedId" in the
  response should match the "id" in the request body.

    Given The api user sets "api/visitorsPurposeDelete" path parameters
    # Api kullanicisi "api/visitorsPurposeDelete" path parametrelerini olusturur
    When The api user prepares a DELETE request to send to the api visitorsPurposeDelete endpoint with id 1047
    # Api kullanıcısı api visitorsPurposeDelete endpointine gönderilmek üzere bir DELETE request hazırlar
    Then The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    And The api user verifies that the status code is 200
    # Api kullanicisi status codeun 200 oldugunu dogrular
    And The api user verifies that the "message" information in the response body is "Success"
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    And The api user verifies that the DeletedId information is the same as the id information in the request body
    # Api kullanıcısı DeletedId bilgisinin request body icindeki id bilgisi ile ayni oldugunu dogrular


  Scenario:TC025[US008] When a DELETE body containing valid authorization information and invalid data (id) is sent to the
  /api/visitorsPurposeDelete endpoint, the status code returned is 203 and the message information in the response
  body is "No id or wrong id. Please check your id number." It should be verified that it is.

    Given The api user sets "api/visitorsPurposeDelete" path parameters.
    # Api kullanicisi "api/visitorsPurposeDelete" path parametrelerini olusturur
    When The api user prepares a DELETE request to send to the api visitorsPurposeDelete add endpoint.
    # Api kullanıcısı api visitorsPurposeDelete endpointine gönderilmek üzere bir DELETE request hazırlar.
    Then The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    And The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    And The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id. Please check your id number." oldugunu dogrular


  Scenario:TC026[US008] When a DELETE request that does not contain valid authorization information and data (id) is sent to the
  /api/visitorsPurposeDelete endpoint, the status code returned is 203 and the message information in the response body
  is "No id or wrong id. Please check your id number." It should be verified that it is.

    * The api user sets "api/visitorsPurposeDelete" path parameters.
    # Api kullanicisi "api/visitorsPurposeDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request that does not contain data
    # Api kullanicisi data icermeyen bir delete request hazırlar
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No id or wrong id. Please check your id number.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id. Please check your id number." oldugunu dogrular



  Scenario:TC027[US008] Invalid Token When a DELETE body is sent to the /api/visitorsPurposeDelete endpoint with invalid authorization information,
  it should be verified that the status code returned is 403 and the message in the response body is
  "You do not have authorization or token error".

    Given The api user sets "api/visitorsPurposeDelete" path parameters.
    # Api kullanicisi "api/visitorsPurposeDelete" path parametrelerini olusturur
    When The api user prepares a DELETE request that does not contain data
    # Api kullanicisi data icermeyen bir delete request hazırlar
    Then The api user sends a DELETE request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular


  Scenario Outline:TC029[US008] It must be verified via the API that the visitor purpose record that is requested to be deleted via
  the API has been deleted.

    Given The api user sets "api/visitorsPurposeId" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    Then The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    And The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    And The api user verifies that the "message" information in the response body is "No id or wrong id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id or wrong id." oldugunu dogrular

    Examples:
      | id  |
      | 772 |



