Feature: Create Token

  Scenario: Create Token
    Given url apiUrl
    And path 'users/login'
    And request {"user": {"email": "#(userEmail)","password": "#(userPassword)"}}
    When method Post
    Then status 200
    * def authToken = 'Token ' + response.user.token
    And header Authorization = authToken
    And print "Token created with callsingle should execute only once by suit"
