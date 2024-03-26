@ignore
Feature: Sign un new user

Background: Define URL
 Given url  apiUrl

  Scenario: New user Sign Up
    Given def userData = {"email":"karateUser259Test.com","username":"test59"}
    And path 'users'
    And request
    """
    {
      "user": {
          "email": #(userData.email),
          "username": #(userData.username),
          "password": "8988fau"
       }
    }
    """
    When method Post
    Then status 201
