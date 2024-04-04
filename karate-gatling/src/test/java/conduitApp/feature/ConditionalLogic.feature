@debug
Feature: Conditional Logic

  Background: Pre Conditions
    * url  apiUrl

  Scenario: Testing conditional logic
    Given params {limit:10, offset:0}
    Given path 'articles'
    When method Get
    Then status 200
    * def favoritesCount = response.articles[0].favoritesCount
    * def article = response.articles[0]
    * if(favoritesCount == 0) karate.call('classpath:helpers/AddLikes.feature',article)
    Given params {limit:10, offset:0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles[0].favoritesCount == 1
