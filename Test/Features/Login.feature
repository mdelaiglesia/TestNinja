Feature: Login
	As an annonymous user 
	I want to be logged in

@mytag
Scenario: Failed log in with empty email
	Given I am on the log in page
	When I submit the log in with email '' and password ''
	Then I should see "Oh snap! You forgot to enter your email."