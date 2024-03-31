Feature: Sign un new user
Background: Preconditions
 Given url  apiUrl
  * def dataGenerator = Java.type('helpers.DataGenerator')

  Scenario: New user Sign Up
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUsername()
    Given path 'users'
    And request
    """
    {
      "user": {
          "email": #(randomEmail),
          "username": #(randomUsername),
          "password": "8988fau"
       }
    }
    """
    When method Post
    Then status 201
    And match response ==
    """
    {
        "user": {
            "id": "#number",
            "email": #(randomEmail),
            "username": #(randomUsername),
            "bio": "##string",
            "image": "#notnull",
            "token": "#string"
          }
    }
    """


  Scenario: Testing non static method from java class
      * def jsFunction =
      """
        function(){
          var DataGenerator = Java.type('helpers.DataGenerator')
          var generator = new DataGenerator()
          return generator.notStaticMethod()
        }
      """
      * def variable = call jsFunction
      * print variable

