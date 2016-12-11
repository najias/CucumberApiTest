Feature: Feature Template

	Scenario: Sample scenario
		Given My api based URL is "baseUrl" 
			And Port number is "port"	
		When My request method is "method"
			And I set header "Key" as "value"
			And I set query parameter "param" as "value"
			And I set path parameter "param" as "value"
			And i set request body from "fileName"
			And I make a request to "endpoint"
		Then I expect status code as "statusCode"
			And I want to print respones body
			And I expect "node" equals "value" in response body
			And I expect "node" contains "value" in response body