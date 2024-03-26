Feature: Create Token

  Scenario: Create Token
    Given url apiUrl
    Given path 'users/login'
    And request {"user": {"email": "#(userEmail)","password": "#(userPassword)"}}
    When method Post
    Then status 200
    * def authToken = 'Token ' + response.user.token
    Given header Authorization = authToken