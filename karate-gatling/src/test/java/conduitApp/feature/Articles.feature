
@debug
Feature: Articles

  Background: Define URL
    Given url  apiUrl
    #email and password as parameters to the feature
    #using callonce karate framework will keep the cash and not run again for each scenario
#    * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature')
#    * def token = tokenResponse.authToken

    Scenario: Create a new article
#      Given header authorization = token
      Given path 'articles'
      And request {"article": {"title": "API Test Conduit 566","description": "API Test Conduit 566","body": "Teste 8898 ","tagList": []}}
      When method Post
      Then status 201
      And match response.article.title contains 'API Test Conduit'
#
  Scenario: Create and delete an article
#    Given header authorization = token
    And path 'articles'
    And request {"article": {"title": "Delete article test 789","description": "Teste 789","body": "Teste 8898 ","tagList": []}}
    When method Post
    Then status 201
    And def id = response.article.slug
#    And header authorization = token
    And path 'articles',id
    And method Delete
    And status 204





