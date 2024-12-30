Feature: As an administrator (admin), I should be able to update the visitor purpose information registered in the system via API connection.

  Scenario Outline:TC019[US007] A PATCH request to the "/api/visitorsPurposeUpdate" endpoint with valid authorization and correct
  data (id, visitors_purpose, description) should return a 200 status code, a response body message of "Success," and
  the "updateId" in the response should match the "id" in the request body. The update should be confirmed via a GET
  request to the "/api/visitorsPurposeId" endpoint using the "updateId" from the response.

    Given The api user sets "api/visitorsPurposeUpdate" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    When The api user prepares a PATCH request containing <id>, "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeUpdate endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    And The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    And The api user verifies that the "message" information in the response body is "Success".
    # Api kullanicisi response bodydeki message bilgisinin "Success" oldugunu dogrular
    And The api user verifies that the updateid information in the Response body is the same as the id information in the patch request body.
    # Api kullanıcısı Response body icindeki updateId bilgisinin patch request body icindeki id bilgisi ile ayni oldugunu dogrular

    Examples:
      | id  | visitors_purpose  | description                                                         |
      | 766 | Medical Follow-Up | Visiting the hospital for a scheduled medical follow-up appointment |

  Scenario Outline: TC019[US007] When a PATCH body (id, visitors_purpose, description) containing valid authorization information
  and invalid (id) is sent to the /api/visitorsPurposeUpdate endpoint, the status code returned is 203 and the message
  information in the response body is "Wrong information or missing information. Please check your input data and id
  number." should be verified.

    Given The api user sets "api/visitorsPurposeUpdate" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    When The api user prepares a PATCH request containing <id>, "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeUpdate endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    And The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    And The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular

    Examples:
      | id    | visitors_purpose | description            |
      | 85692 | purpose update   | purpose update details |


  Scenario Outline:TC020[US007] When a PATCH body (visitors_purpose, description) that does not contain valid authorization
  information (id) is sent to the /api/visitorsPurposeUpdate endpoint, the status code returned is 203 and the
  message information in the response body is "Wrong information or missing information. Please check your input
  data and id number." It should be verified that it is.

    Given The api user sets "api/visitorsPurposeUpdate" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    When The api user prepares a PATCH request that does not contain an id but includes "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeUpdate endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin id içermeyen ama "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    And The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    And The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular

    Examples:
      | visitors_purpose | description            |
      | purpose update   | purpose update details |


  Scenario:TC021[US007] When a PATCH request that does not contain valid authorization information and data is sent to the
  /api/visitorsPurposeUpdate endpoint, the status code returned is 203 and the message information in the response
  body is "Wrong information or missing information. Please check your input data and id number."
  It should be verified that it is.

    Given The api user sets "api/visitorsPurposeUpdate" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    When The api user prepares a PATCH request that does not contain data.
    # Api kullanicisi data icermeyen bir patch request hazırlar
    And The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    Then The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    And The api user verifies that the "message" information in the response body is "Wrong information or missing information. Please check your input data and id number.".
    # Api kullanicisi response bodydeki message bilgisinin "Wrong information or missing information. Please check your input data and id number." oldugunu dogrular

  Scenario Outline:TC022[US007] Invalid Token When sending a PATCH body (id, visitors_purpose, description) with invalid authorization information
  to the /api/visitorsPurposeUpdate endpoint, it should be verified that the status code returned is 403 and the message
  in the response body is "You do not have authorization or token error".

    Given The api user sets "api/visitorsPurposeUpdate" path parameters.
    # Api kullanicisi "api/visitorsPurposeUpdate" path parametrelerini olusturur
    When The api user prepares a PATCH request containing <id>, "<visitors_purpose>" and "<description>" information to send to the api visitorsPurposeUpdate endpoint.
    # Api kullanicisi api visitorsPurposeUpdate endpointine gondermek icin "<visitors_purpose>" ve "<description>" bilgilerini iceren bir patch request hazirlar
    Then The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '403' ve reason phrase bilgisinin Forbidden oldugunu dogrular

    Examples:
      | id  | visitors_purpose | description            |
      | 756 | purpose update   | purpose update details |

  Scenario Outline: TC022[US007] It must be verified via the API that the visitor purpose record that you want to update via the API
  has been updated.

    * The api user sets "api/visitorsPurposeUpdate" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    * The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    * The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    * The api user verifies that the "lists.visitors_purpose" information in the response body is "purpose update".
    # Api kullanicisi response bodydeki lists.visitors_purpose bilgisinin "purpose update" oldugunu dogrular

    Examples:
      | id  |
      | 756 |

  Scenario Outline:TC023[US007] It must be verified via the API that the visitor purpose record that you want to update via the API
  has been updated.

    Given The api user sets "api/visitorsPurposeId" path parameters.
    # Api kullanicisi "api/visitorsPurposeId" path parametrelerini olusturur
    When The api user prepares a GET request containing the <id> information to send to the api visitorsPurposeid endpoint.
    # Api kullanicisi api visitorsPurposeId endpointine gondermek icin <id> bilgisini iceren bir get request hazirlar
    Then The api user sends a GET body and saves the returned response.
    # Api kullanicisi GET body gonderir ve donen responsei kaydeder
    And The api user verifies that the "lists.visitors_purpose" information in the response body is "Medical Follow-Up".
     # Api kullanicisi response bodydeki lists.visitors_purpose bilgisinin "purpose update" oldugunu dogrular

    Examples:
      | id  |
      | 766 |


