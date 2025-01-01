
package stepdefinitions;

import base.BaseTest;
import hooks.api.HooksAPI;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.hamcrest.Matchers;
import org.json.JSONObject;
import org.junit.Assert;
import pojos.Pojo;
import utilities.api.API_Methods;
import utilities.api.TestData;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.sun.beans.introspect.PropertyInfo.Name.description;
import static hooks.api.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static io.restassured.RestAssured.requestSpecification;
import static org.hamcrest.CoreMatchers.containsString;
import static org.junit.Assert.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static utilities.api.API_Methods.*;

public class apiStepdefinitions extends BaseTest {

    TestData testData = new TestData();
    String exceptionMesaj = null;
    Pojo pojoRequest;
    private String jsonBody;


    @Given("The api user sets {string} path parameters.")
    public void the_api_user_sets_path_parameters(String pathParam) {
        API_Methods.pathParam(pathParam);

    }

    @When("The api user sets {string} path parameters")
    public void theApiUserSetsPathParameters(String pathparam) {
        API_Methods.pathParam(pathparam);
    }


    @Given("The api user prepares a valid GET request to the {string} endpoint with proper authorization")
    public void theApiUserPreparesAValidGETRequestToTheEndpointWithProperAuthorization(String pathparam) {

        API_Methods.pathParam(pathparam);
    }

    @When("The api user sends the GET request and saves the response")
    public void theApiUserSendsTheGETRequestAndSavesTheResponse() {
        response = given()
                .spec(spec)
                .when()
                .get(fullPath);

        response.prettyPrint();
    }

    @Then("The api user verifies that the status code is {int}")
    public void theApiUserVerifiesThatTheStatusCodeIs(int code) {
        response.then()
                .assertThat()
                .statusCode(code);

    }

    @And("The api user verifies that the {string} information in the response body is {string}")
    public void theApiUserVerifiesThatTheInformationInTheResponseBodyIs(String key, String value) {
        response.then()
                .assertThat()
                .body(key, Matchers.equalTo(value));
    }

    @And("The api user prepares a GET request to send to the api staffList endpoint with invalid authorization")
    public void theApiUserPreparesAGETRequestToSendToTheApiStaffListEndpointWithInvalidAuthorization() {
        // Hooks sınıfında geçersiz token zaten ayarlandı, burada ek işlem gerekmez
        System.out.println("GET request prepared with invalid authorization.");

    }

    @And("The api user prepares a GET request with an invalid token")
    public void theApiUserPreparesAGETRequestWithAnInvalidToken() {
        spec.header("Authorization", "Bearer invalidToken");
        System.out.println("GET request prepared with an invalid token.");
    }

    @When("The API user has invalid authorization token {string}")
    public void theAPIUserHasInvalidAuthorizationToken(String invalidToken) {
        response = given()
                .spec(spec)
                .header("Authorization", "Bearer " + invalidToken) // Geçersiz token ekleniyor
                .when()
                .get(fullPath);  // fullPath doğru şekilde tanımlanmalı
        response.prettyPrint();  // Yanıtı konsola yazdır
    }

    @Given("An api user sends a {string} request with invalid token and correct data, saves the returned response, verifies that the returned status code is {int} with the reason phrase {string}.")
    public void an_api_user_sends_a_request_with_invalid_token_and_correct_data_saves_the_returned_response_verifies_that_the_information_in_the_response_body_is(String httpMethod, Integer code, String value) {


        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .post(fullPath);

        response.prettyPrint();

        API_Methods.statusCodeAssert(code);
        API_Methods.assertBody("message", value);

    }

    @Given("The api user sends a GET request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.")
    public void the_api_user_sends_a_get_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden() {
        try {
            response = given()
                    .spec(spec)
                    .when()
                    .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);

    }

    @When("The api user sends a GET request, saves the returned response, and verifies that the status code is {int}")
    public void theApiUserSendsAGETRequestSavesTheReturnedResponseAndVerifiesThatTheStatusCodeIs(int code) {
        response = sendRequest("GET", "");
        statusCodeAssert(200);

    }


    @Then("The api user verifies that the response body contains {string}, {string}, {string}, {string}, and {string}")
    public void theApiUserVerifiesThatTheResponseBodyContainsAnd(String dataIndex, String id, String name, String surname, String employee_id) {
        repJP = response.jsonPath();

        Assert.assertEquals(id, repJP.getString("lists[" + dataIndex + "].id"));
        Assert.assertEquals(name, repJP.getString("lists[" + dataIndex + "].name"));
        Assert.assertEquals(surname, repJP.getString("lists[" + dataIndex + "].surname"));
        Assert.assertEquals(employee_id, repJP.getString("lists[" + dataIndex + "].employee_id"));
    }

    @Given("The api user sends a GET request and saves the returned response.")
    public void the_api_user_sends_a_get_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .when()
                .get(fullPath);

        response.prettyPrint();
    }


    @Then("The api user verifies that the response body contains {string}, {string}, {string}, {string}")
    public void theApiUserVerifiesThatTheResponseBodyContains(String dataIndex, String id, String patient_name, String patient_id) {

        repJP = response.jsonPath();

        Assert.assertEquals(id, repJP.getString("lists[" + dataIndex + "].id"));
        Assert.assertEquals(patient_name, repJP.getString("lists[" + dataIndex + "].patient_name"));
        Assert.assertEquals(patient_id, repJP.getString("lists[" + dataIndex + "].patient_id"));
    }

    @Given("The api user prepares a GET request containing the {int} information to send to the api visitorsPurposeid endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_visitors_purposeid_endpoint(int id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);
    }

    @When("The api user prepares a GET request containing the {int} information to send to the api's endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_s_endpoint(int id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);
    }


    @Given("The api user sends a GET body and saves the returned response.")
    public void the_api_user_sends_a_get_body_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .get(fullPath);

        response.prettyPrint();
    }


    @And("The api user verifies that the visitorPurpose response body contains {string}, {string}, {string}, {string}")
    public void theApiUserVerifiesThatTheVisitorPurposeResponseBodyContains(String id, String visitors_purpose, String description, String created_at) {
        JsonPath repJP = response.jsonPath();

        Assert.assertEquals("The ID does not match the expected value.", id, repJP.getString("lists.id"));
        Assert.assertEquals("The visitors_purpose does not match the expected value.", visitors_purpose, repJP.getString("lists.visitors_purpose"));
        Assert.assertEquals("The description does not match the expected value.", description, repJP.getString("lists.description"));
        Assert.assertEquals("The created_at does not match the expected value.", created_at, repJP.getString("lists.created_at"));
    }


    @Given("The api user prepares a GET request containing the {int} information to send to the api visitorsPurposeId endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_visitors_purpose_Id_endpoint(int id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);
    }


    @And("The api user verifies that the visitorsPurposeId response body contains {string}, {string}, {string}, {string}")
    public void theApiUserVerifiesThatTheVisitorPurposeIdResponseBodyContains(String id, String visitors_purpose, String description, String created_at) {
        JsonPath repJP = response.jsonPath();

        Assert.assertEquals("The ID does not match the expected value.", id, repJP.getString("lists.id"));
        Assert.assertEquals("The visitors_purpose does not match the expected value.", visitors_purpose, repJP.getString("lists.visitors_purpose"));
        Assert.assertEquals("The description does not match the expected value.", description, repJP.getString("lists.description"));
        Assert.assertEquals("The created_at does not match the expected value.", created_at, repJP.getString("lists.created_at"));
    }

    @Given("The api user prepares a GET request containing the {int} information to send to the api visitorsPurposeList endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_visitors_purpose_list_endpoint(int id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);
    }

    @Then("The api user verifies that the visitorList response body contains {string}, {string}, {string}, {string}")
    public void the_api_user_verifies_that_the_visitor_list_response_body_contains(String id, String visitors_purpose, String description, String created_at) {
        JsonPath repJP = response.jsonPath();

        Assert.assertEquals("The ID does not match the expected value.", id, repJP.getString("lists.id"));
        Assert.assertEquals("The visitors_purpose does not match the expected value.", visitors_purpose, repJP.getString("lists.visitors_purpose"));
        Assert.assertEquals("The description does not match the expected value.", description, repJP.getString("lists.description"));
        Assert.assertEquals("The created_at does not match the expected value.", created_at, repJP.getString("lists.created_at"));
    }

    @Given("The api user prepares a GET request containing the {string} information to send to the api visitorsPurposeId endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_information_to_send_to_the_api_visitors_purpose_ıd_endpoint(String id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);


    }

    @Given("api user prepares a POST request containing {string} and {string} information to send to the api visitorsPurposeAdd endpoint.")
    public void api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_visitors_purpose_add_endpoint(String visitors_purpose, String description) {
        map.put("visitors_purpose", visitors_purpose);
        map.put("description", description);

        System.out.println("Post Body : " + map);
    }

    @When("api user sends a POST request and saves the returned response.")
    public void api_user_sends_a_post_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec) // Spec içindeki base URL ve diğer ayarlar
                .contentType(ContentType.JSON) // İçerik türü JSON
                .when()
                .body(map) // Gönderilecek JSON gövdesi
                .post(fullPath); // POST isteğiath);

        response.prettyPrint();
    }

    @Given("The api user prepares a POST request containing {string} and {string} information to send to the api visitorsPurposeAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_visitors_purpose_add_endpoint(String visitors_purpose, String description) {
        map.put("visitors_purpose", visitors_purpose);
        map.put("description", description);

        System.out.println("Post Body : " + map);
    }

    @Given("The api user prepares a POST request that does not contain data")
    public void the_api_user_prepares_a_post_request_that_does_not_contain_data() {

    }

    @Given("The api user verifies that the status code is {int}.")
    public void the_api_user_verifies_that_the_status_code_is(int code) {
        response.then()
                .assertThat()
                .statusCode(code);
    }

    @Given("The api user sends a POST request and saves the returned response.")
    public void the_api_user_sends_a_post_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(map)
                .post(fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String visitors_purpose, String description, String created_at) {
        repJP = response.jsonPath();

        assertEquals(visitors_purpose, repJP.getString("lists[" + dataIndex + "].visitors_purpose"));
        assertEquals(description, repJP.getString("lists[" + dataIndex + "].description"));
        assertEquals(created_at, repJP.getString("lists[" + dataIndex + "].created_at"));
    }

    @Given("The api user verifies that the {string} information in the response body is {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        response.then()
                .assertThat()
                .body(key, Matchers.equalTo(value));
    }

    @Given("The api user prepares a PATCH request containing {int}, {string} and {string} information to send to the api visitorsPurposeUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_visitors_purpose_update_endpoint(int id, String visitors_purpose, String description) {
        map = testData.visitorsPurposeUpdateRequestBody(id, visitors_purpose, description);

        System.out.println("Patch Body : " + map);
    }

    @Given("The api user sends a PATCH request and saves the returned response.")
    public void the_api_user_sends_a_patch_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(map)
                .patch(fullPath);

        response.prettyPrint();
    }

    @And("The api user verifies that the updateid information in the Response body is the same as the id information in the patch request body.")
    public void theApiUserVerifiesThatTheUpdateidInformationInTheResponseBodyIsTheSameAsTheIdInformationInThePatchRequestBody() {
        repJP = response.jsonPath();

        Assert.assertEquals(map.get("id"), repJP.getInt("updateId"));
    }

    @When("The api user prepares a PATCH request that does not contain data.")
    public void theApiUserPreparesAPATCHRequestThatDoesNotContainData() {

        pojoRequest = new Pojo();

    }

    @Given("The api user sends a PATCH request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.")
    public void the_api_user_sends_a_patch_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden() {
        try {
            response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(map)
                    .patch(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);
    }

    @Given("The api user prepares a DELETE request to send to the api visitorsPurposeDelete add endpoint.")
    public void the_api_user_prepares_a_delete_request_to_send_to_the_api_visitors_purpose_delete_add_endpoint() {
        requestBody.put("id", 0007);

        System.out.println("Delete Body : " + requestBody);
    }


    @Then("The api user sends a DELETE request and saves the returned response.")
    public void theApiUserSendsADELETERequestAndSavesTheReturnedResponse() {

        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody.toString())
                .delete(fullPath);

        response.prettyPrint();
    }

    @When("The api user sends the DELETE request")
    public void the_api_user_sends_the_delete_request(int id) {
        requestBody.put("id", id);

        System.out.println("Get Body : " + requestBody);
    }


    @When("The api user prepares a DELETE request to send to the api visitorsPurposeDelete endpoint with id {int}")
    public void theApiUserPreparesADELETERequestToSendToTheApiVisitorsPurposeDeleteEndpointWithId(int id) {
        requestBody.put("id", id);

        System.out.println("Prepared DELETE Request Body: " + requestBody.toString());

    }

    @And("The api user verifies that the DeletedId information is the same as the id information in the request body")
    public void the_api_user_verifies_that_the_deleted_id_information_is_the_same_as_the_id_information_in_the_request_body() {
        Integer deletedId = response.jsonPath().getInt("DeletedId");
        Integer requestId = (Integer) requestBody.get("id");
        assertEquals(requestId, deletedId);
        System.out.println("DeletedId Verified: " + deletedId);
    }

    @Given("The api user prepares a DELETE request that does not contain data")
    public void the_api_user_prepares_a_delete_request_that_does_not_contain_data() {

    }

    @Given("The api user sends a DELETE request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.")
    public void the_api_user_sends_a_delete_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden
            () {
        try {
            response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(requestBody.toString())
                    .delete(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);
    }

    @When("The api user prepares a PATCH request that does not contain an id but includes {string} and {string} information to send to the api visitorsPurposeUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_that_does_not_contain_an_id_but_includes_and_information_to_send_to_the_api_visitors_purpose_update_endpoint(String visitors_purpose, String description) {

        requestBody.put("visitors_purpose", visitors_purpose);
        requestBody.put("description", description);

    }

    @Then("The api user verifies visitorsList that the response body contains {string}, {string}, {string}, {string}, and {string}")
    public void theApiUserVerifiesVisitorsListThatTheResponseBodyContainsAnd(String id, String name, String source, String purpose) {

        repJP = response.jsonPath();
        Assert.assertEquals(id, repJP.getString("lists[0].id"));
        Assert.assertEquals(name, repJP.getString("lists[0].name"));
        Assert.assertEquals(source, repJP.getString("lists[0].source"));
        Assert.assertEquals(purpose, repJP.getString("lists[0].purpose"));

    }

    @And("The api user verifies that the visitorsID response body contains {string}")
    public void theApiUserVerifiesThatTheVisitorsIDResponseBodyContains(String id) {
        JsonPath repJP = response.jsonPath();

        Assert.assertEquals("The ID does not match the expected value.", id, repJP.getString("lists.id"));

    }

    @When("The api user verifies visitorsID that the response body contains {string},{string},{string},{string},{string},{string}")
    public void theApiUserVerifiesVisitorsIDThatTheResponseBodyContains(
            String id, String source, String purpose, String name, String email, String created_at) {
        response.then()
                .assertThat()
                .body("lists.id", Matchers.equalTo(id),
                        "lists.source", Matchers.equalTo(source),
                        "lists.purpose", Matchers.equalTo(purpose),
                        "lists.name", Matchers.equalTo(name),
                        "lists.email", Matchers.equalTo(email),
                        "lists.created_at", Matchers.equalTo(created_at));
    }


    @And("The api user prepares a POST request containing {string} and {string} information to send to the api visitorsAdd endpoint.")
    public void theApiUserPreparesAPOSTRequestContainingAndInformationToSendToTheApiVisitorsAddEndpoint(String purpose, String name) {

        requestBody.put("purpose", purpose);
        requestBody.put("name", name);

    }


    @Given("The api user prepares a Json POST request containing {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, and {string} information to send to the api visitorsAdd endpoint.")
    public void the_api_user_prepares_a_json_post_request_containing_and_information_to_send_to_the_api_visitors_add_endpoint(String source, String purpose, String name, String email, String contact, String idProof, String visitTo, String ipdOpdStaffId, String relatedTo, String noOfPeople, String date, String inTime, String outTime, String note) {
        jsonBody = String.format("""
                {
                    "source": "%s",
                    "purpose": "%s",
                    "name": "%s",
                    "email": "%s",
                    "contact": "%s",
                    "id_proof": "%s",
                    "visit_to": "%s",
                    "ipd_opd_staff_id": "%s",
                    "related_to": "%s",
                    "no_of_pepple": "%s",
                    "date": "%s",
                    "in_time": "%s",
                    "out_time": "%s",
                    "note": "%s"
                }
                """, source, purpose, name, email, contact, idProof, visitTo, ipdOpdStaffId, relatedTo, noOfPeople, date, inTime, outTime, note);
    }

    @When("api user sends a Json POST request and saves the returned response.")
    public void apiUserSendsAJsonPOSTRequestAndSavesTheReturnedResponse() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .body(jsonBody)
                .post(fullPath);

        response.prettyPrint();

    }


    @And("The api user prepares a FAKE Json POST request containing {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, and {string} information to send to the api visitorsAdd endpoint.")
    public void theApiUserPreparesAFAKEJsonPOSTRequestContainingAndInformationToSendToTheApiVisitorsAddEndpoint(String fakeone, String fakeone2, String name, String email, String contact, String idProof, String visitTo, String ipdOpdStaffId, String relatedTo, String noOfPeople, String date, String inTime, String outTime, String note) {

        jsonBody = String.format("""
                {
                    "fakeone": "%s",
                    "fakeone2": "%s",
                    "name": "%s",
                    "email": "%s",
                    "contact": "%s",
                    "id_proof": "%s",
                    "visit_to": "%s",
                    "ipd_opd_staff_id": "%s",
                    "related_to": "%s",
                    "no_of_pepple": "%s",
                    "date": "%s",
                    "in_time": "%s",
                    "out_time": "%s",
                    "note": "%s"
                }
                """, fakeone, fakeone2, name, email, contact, idProof, visitTo, ipdOpdStaffId, relatedTo, noOfPeople, date, inTime, outTime, note);
    }

    @And("The api user prepares a Json PATCH request containing {string},{string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, and {string} information to send to the api visitorsAdd endpoint.")
    public void theApiUserPreparesAJsonPATCHRequestContainingAndInformationToSendToTheApiVisitorsAddEndpoint(String id, String source, String purpose, String name, String email, String contact, String idProof, String visitTo, String ipdOpdStaffId, String relatedTo, String noOfPeople, String date, String inTime, String outTime, String note) {

        jsonBody = String.format("""
                {
                    "id": "%s",
                    "source": "%s",
                    "purpose": "%s",
                    "name": "%s",
                    "email": "%s",
                    "contact": "%s",
                    "id_proof": "%s",
                    "visit_to": "%s",
                    "ipd_opd_staff_id": "%s",
                    "related_to": "%s",
                    "no_of_pepple": "%s",
                    "date": "%s",
                    "in_time": "%s",
                    "out_time": "%s",
                    "note": "%s"
                }
                """, id, source, purpose, name, email, contact, idProof, visitTo, ipdOpdStaffId, relatedTo, noOfPeople, date, inTime, outTime, note);
    }

    @When("api user sends a Json PATCH request and saves the returned response.")
    public void apiUserSendsAJsonPATCHRequestAndSavesTheReturnedResponse() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .body(jsonBody)
                .patch(fullPath);

        response.prettyPrint();
    }

    @And("The api user prepares a Json FAKE PATCH request containing {string},{string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, and {string} information to send to the api visitorsAdd endpoint.")
    public void theApiUserPreparesAJsonFAKEPATCHRequestContainingAndInformationToSendToTheApiVisitorsAddEndpoint(String id, String id2, String purpose, String name, String email, String contact, String idProof, String visitTo, String ipdOpdStaffId, String relatedTo, String noOfPeople, String date, String inTime, String outTime, String note) {

        jsonBody = String.format("""
                {
                    "id": "%s",
                    "source": "%s",
                    "purpose": "%s",
                    "name": "%s",
                    "email": "%s",
                    "contact": "%s",
                    "id_proof": "%s",
                    "visit_to": "%s",
                    "ipd_opd_staff_id": "%s",
                    "related_to": "%s",
                    "no_of_pepple": "%s",
                    "date": "%s",
                    "in_time": "%s",
                    "out_time": "%s",
                    "note": "%s"
                }
                """, id, id2, purpose, name, email, contact, idProof, visitTo, ipdOpdStaffId, relatedTo, noOfPeople, date, inTime, outTime, note);
    }


    @Then("The API user verifies that the status code is {int}")
    public void theAPIUserVerifiesThatTheStatusCodeIs() {
        Assert.assertEquals(403, response.getStatusCode());


    }

    @And("The API user verifies that the message in the response body is {string}")
    public void theAPIUserVerifiesThatTheMessageInTheResponseBodyIs() {
        String reasonPhrase = response.getStatusLine(); // StatusLine'dan mesajı alır
        Assert.assertTrue(reasonPhrase.contains("Forbidden"));
    }


    @When("The api user prepares a DELETE request to send to the api's endpoint with id {int}")
    public void theApiUserPreparesADELETERequestToSendToTheApiSEndpointWithId(int id) {
        requestBody = new JSONObject();
        requestBody.put("id", id);


    }
    @Given("The api user sends a  request, saves the returned response, and verifies that the status code is '403' with the reason phrase Forbidden.")
    public void the_api_user_sends_a_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_forbidden() {
        try {
            response = given()
                    .spec(spec)
                    .when()
                    .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }

        System.out.println("exceptionMesaj : " + exceptionMesaj);
        assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);

    }

}




