Feature: Job API: newjobs endpoint test

	Scenario: get job for all valid credentials
		Given My api based URL is "http://job.qa.elitecareer.net" 	
		When My request method is "GET"
			And I set header "Content-Type" as "application/json"
			And I set header "fusion-api-key" as "fusionqateam"
			And I make a request to "/api/v1/newjobs"
		Then I expect status code as "200"
			And I want to print respones body
		
		
		Scenario: get proper error message for invalid method
		Given My api based URL is "http://job.qa.elitecareer.net" 	
		When My request method is "POST"
			And I set header "Content-Type" as "application/json"
			And I set header "fusion-api-key" as "fusionqateam"
			And I make a request to "/api/v1/newjobs"
		Then I expect status code as "405"
			And I want to print respones body
			And I expect "data.detail" equals "Specified method is not allowed" in response body
		
		
	Scenario: get proper error message for invalid api-key
		Given My api based URL is "http://job.qa.elitecareer.net" 	
		When My request method is "GET"
			And I set header "Content-Type" as "application/json"
			And I set header "fusion-api-key" as "invalid"
			And I make a request to "/api/v1/newjobs"
		Then I expect status code as "401"
			And I want to print respones body
			And I expect "data.detail" equals "The specified api key is invalid" in response body
		
		
		Scenario: get proper error message for missing api-key
		Given My api based URL is "http://job.qa.elitecareer.net" 	
		When My request method is "GET"
			And I set header "Content-Type" as "application/json"
			And I make a request to "/api/v1/newjobs"
		Then I expect status code as "401"
			And I want to print respones body
			And I expect "data.detail" equals "The specified api key is invalid" in response body
			
	Scenario: get proper error message for invalid endpoint
		Given My api based URL is "http://job.qa.elitecareer.net" 	
		When My request method is "GET"
			And I set header "Content-Type" as "application/json"
			And I set header "fusion-api-key" as "fusionqateam"
			And I make a request to "/api/v1/invalid"
		Then I expect status code as "404"
			And I want to print respones body
			And I expect "data.detail" equals "The specified Endpoint is invalid" in response body
			
			
			
#	Scenario: Sample scenario
#		Given My api based URL is "baseUrl" 
#			And Port number is "port"	
#		When My request method is "method"
#			And I set header "Key" as "value"
#			And I set query parameter "param" as "value"
#			And I set path parameter "param" as "value"
#			And i set request body from "fileName"
#			And I make a request to "endpoint"
#		Then I expect status code as "statusCode"
#			And I want to print respones body
#			And I expect "node" equals "value" in response body
#			And I expect "node" contains "value" in response body
