Feature: Login
	As an annonymous user 
	I want to be logged in

Scenario: Failed log in with empty email
	Given I am on the log in page
	When I submit the log in with email '' and password ''
	Then I should see "Oh snap! You forgot to enter your email."

Scenario: Failed log in with empty password
	Given I am on the log in page
	When I submit the log in with email 'matiasdelaiglesia@gmail.com' and password ''
	Then I should see "Oh snap! You forgot to enter your password."

Scenario: Failed log in with invalid email format
	Given I am on the log in page
	When I submit the log in with email 'matiasdelaiglesia' and password ''
	Then I should see "Oh snap! Format your email and try again."

Scenario: Failed log in with unknown user
	Given I am on the log in page
	When I submit the log in with email 'mdelaiglesia@cys.com.ar' and password '12345678'
	Then I should see "Oh snap! I don't know who you are any more."

Scenario: Failed log in with invalid password
	Given I am on the log in page
	When I submit the log in with email 'matiasdelaiglesia@gmail.com' and password 'password'
	Then I should see "Oh snap! Did you forgot your password?"

Scenario: Successful log in with valid user
	Given I am on the log in page
	When I submit the log in with email 'matiasdelaiglesia@gmail.com' and password '12345678'
	Then I should see "Well done! You're in!"