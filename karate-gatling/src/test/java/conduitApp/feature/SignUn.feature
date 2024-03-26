Feature: Sign un new user

Background: Define URL
 Given url  apiUrl

  @debug
  Scenario: New user Sign Up
    Given def userData = {"email":"karateUser256Test.com","username":"test57"}
    And path 'users'
    And request {"user": {"email": #(userData.email),"password":"098po$","username": #(userData.username)}}
    When method Post
    Then status 201
