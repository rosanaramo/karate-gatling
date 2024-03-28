  Feature: Sign up with data driven

    Background: Preconditions
      * def dataGenerator = Java.type('helpers.DataGenerator')
      * def randomEmail = dataGenerator.getRandomEmail()



    @debug
    Scenario Outline: Validate Sign Up error messages
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUsername()

    Given path 'users'
    Given url apiUrl
    And request
    """
    {
      "user": {
          "email":<email>,
          "username": <username>,
          "password": <password>
       }
    }
    """
    When method Post
    Then status 422
    And match response == <errorResponse>

    Examples:
      |email                    |password      |username             |errorResponse|
      |#(randomEmail)           |"KARATE0098"  |"Karate09983"        |{ "errors": { "username": [ "has already been taken"] }} |
      |"testkarate009@gmail.com"|"**(*&Taljfla"|#(randomUsername)    |{ "errors": { "email": [ "has already been taken"] }}    |
      |""                       |")-(*&&idahft"|#(randomUsername)    |{"errors":{"email":["can't be blank"]}}                  |
      |#(randomEmail)           |"0po9iuuu$%ˆ" |""                   |{"errors": { "username": ["can't be blank"]}}            |
      |#(randomEmail)           |""            |#(randomUsername)    |{"errors": { "password": ["can't be blank"]}}            |