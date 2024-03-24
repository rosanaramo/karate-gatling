Feature: Articles

  Background: Define URL
    Given url 'https://conduit-api.bondaracademy.com/api/'

    @skipme
    Scenario: Create a new article
      Given path 'users/login'
      And request {"user": {"email": "rosanateste@gmail.com","password": "99575137qwr"}}
      When method Post
      Then status 200
      * def token = 'Token ' + response.user.token
      Then print token
      Given header Authorization = token
      Given path 'articles'
      And request {"article": {"title": "Rosana Teste 09090909","description": "Teste 000","body": "Teste 8898 ","tagList": []}}
      When method Post
      Then status 201
      And match response.article.title contains 'Rosana Teste'