@debug
Feature: Articles

  Background: Pre conditions
    * url  apiUrl
    * def articleRequestBody = read('classpath:conduitApp/json/newArticleRequest.json')
    * def dataGenerator = Java.type('helpers.DataGenerator')
    *  articleRequestBody.article.title =dataGenerator.getRandomArticleValues().title
    *  articleRequestBody.article.description =dataGenerator.getRandomArticleValues().description
    *  articleRequestBody.article.body =dataGenerator.getRandomArticleValues().body

  Scenario: Create a new article
    Given path 'articles'
    And request articleRequestBody
    When method Post
    Then status 201
    And match response.article.title == articleRequestBody.article.title

  Scenario: Create and delete an article
    And path 'articles'
    And request articleRequestBody
    When method Post
    Then status 201
    And def id = response.article.slug
    And path 'articles',id
    And method Delete
    And status 204





