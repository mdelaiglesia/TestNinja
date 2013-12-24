Feature: Login
	As an annonymous user 
	I want to be logged in

@mytag
Scenario: Log in with empty email
	Given I am on the log in page
	When I fill email field with ''
	Then I should see "I don't know who you are any more."
