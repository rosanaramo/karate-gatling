
Feature: Articles

  Background: Define URL
    Given url 'https://conduit-api.bondaracademy.com/api/'
    Given path 'users/login'
    And request {"user": {"email": "rosanateste@gmail.com","password": "99575137qwr"}}
    When method Post
    Then status 200
    * def token = 'Token ' + response.user.token
    Given header Authorization = token

    Scenario: Create a new article
      Given path 'articles'
      And request {"article": {"title": "API Test Conduit","description": "API Test Conduit","body": "Teste 8898 ","tagList": []}}
      When method Post
      Then status 201
      And match response.article.title contains 'Rosana Teste'
#
  @debug
  Scenario: Create and delete an article
    Given path 'articles'
    And request {"article": {"title": "Delete article test 06","description": "Teste 0006","body": "Teste 8898 ","tagList": []}}
    When method Post
    Then status 201
    And def id = response.article.slug
    And header authorization = token
    And path 'articles',id
    And method Delete
    And status 204





