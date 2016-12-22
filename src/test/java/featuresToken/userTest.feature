Feature: Token API: user endpoint test

	Scenario: get token for all valid credentials
		Given My api based URL is "http://token.qa.elitecareer.net" 	
		When My request method is "POST"
			And I set header "Content-Type" as "application/json"
			And I set header "fusion-api-key" as "fusionqateam"
			And i set request body from "employerCradentials.json"
			And I make a request to "/api/v1/user"
		Then I expect status code as "201"
			And I want to print respones body
			


	Scenario: get proper error message for invalid method
		Given My api based URL is "http://token.qa.elitecareer.net" 	
		When My request method is "GET"
			And I set header "Content-Type" as "application/json"
			And I set header "fusion-api-key" as "fusionqateam"
			And i set request body from "employerCradentials.json"
			And I make a request to "/api/v1/user"
		Then I expect status code as "405"
			And I want to print respones body
			And I expect "data.detail" equals "Specified method is not allowed" in response body


	Scenario: get proper error message for invalid api-key
		Given My api based URL is "http://token.qa.elitecareer.net" 	
		When My request method is "POST"
			And I set header "Content-Type" as "application/json"
			And I set header "fusion-api-key" as "invalid"
			And i set request body from "employerCradentials.json"
			And I make a request to "/api/v1/user"
		Then I expect status code as "401"
			And I want to print respones body
	    And I expect "data.detail" equals "The specified api key is invalid" in response body


	Scenario: get proper error message for missing api-key
		Given My api based URL is "http://token.qa.elitecareer.net" 	
		When My request method is "POST"
			And I set header "Content-Type" as "application/json"
			And i set request body from "employerCradentials.json"
			And I make a request to "/api/v1/user"
		Then I expect status code as "401"
			And I want to print respones body
      And I expect "data.detail" equals "The specified api key is invalid" in response body


	Scenario: get proper error message for invalid email
		Given My api based URL is "http://token.qa.elitecareer.net" 	
		When My request method is "POST"
			And I set header "Content-Type" as "application/json"
			And I set header "fusion-api-key" as "fusionqateam"
			And i set request body from "employerCradentialsInvalidEmail.json"
			And I make a request to "/api/v1/user"
		Then I expect status code as "401"
			And I want to print respones body
			And I expect "data.detail" equals "Email or Password is invalid" in response body


	Scenario: get proper error message for invalid password
		Given My api based URL is "http://token.qa.elitecareer.net" 	
		When My request method is "POST"
			And I set header "Content-Type" as "application/json"
			And I set header "fusion-api-key" as "fusionqateam"
			And i set request body from "employerCradentialsInvalidPassword.json"
			And I make a request to "/api/v1/user"
		Then I expect status code as "401"
			And I want to print respones body
			And I expect "data.key.password" equals "365827s" in response body


	Scenario: get proper error message for invalid endpoint
		Given My api based URL is "http://token.qa.elitecareer.net" 	
		When My request method is "POST"
			And I set header "Content-Type" as "application/json"
			And I set header "fusion-api-key" as "fusionqateam"
			And i set request body from "employerCradentials.json"
			And I make a request to "/api/v1/invalid"
		Then I expect status code as "405"
			And I want to print respones body
			And I expect "data.detail" equals "The specified Endpoint is invalid" in response body


	Scenario: get proper error message for missing body
		Given My api based URL is "http://token.qa.elitecareer.net" 	
		When My request method is "POST"
			And I set header "Content-Type" as "application/json"
			And I set header "fusion-api-key" as "fusionqateam"
			And I make a request to "/api/v1/user"
		Then I expect status code as "401"
			And I want to print respones body
			And I expect "data.detail" equals "Email or Password is invalid" in response body
			