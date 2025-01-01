Feature: As an administrator (admin), I should be able to access announcements via API connection.


  Scenario:TC064[US019API]Code 200 Validate NoticeAPI Response

    Given The api user prepares a valid GET request to the "api/getNotice" endpoint with proper authorization
    When The api user sends the GET request and saves the response
    Then The api user verifies that the status code is 200
    And The api user verifies that the "message" information in the response body is "Success"

  Scenario: TC065[US019API] /api/getBloodGroup endpoint with Invalid Token information, and it should be verified that the status code returned is 403 and the message in the response body is "You do not have authorization or token error."

    Given The api user prepares a valid GET request to the "api/getBloodGroup" endpoint with proper authorization
    And The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.


  Scenario Outline:TC066 [US019API] Validate notice details in the response body

    Given The api user sets "api/getNotice" path parameters
    When The api user sends a GET request, saves the returned response, and verifies that the status code is 200
    Then The api user verifies that the Notice response body contains "<dataIndex>", "<id>", "<type>", "<slug>","<url>" and "<date>"

    Examples:
      | dataIndex | id  | type   | slug             | url  | date       |
      | 0         | 794 | notice | noticedeneme     | null | 2024-12-27 |
      | 1         | 795 | notice | new-announcement | null | 2024-12-27 |



