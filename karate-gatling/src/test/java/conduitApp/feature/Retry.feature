Feature: Retry

  Background: Pre conditions
    * url  apiUrl

  Scenario: Retry call
    * configure retry = {count: 10, interval:5000}
    Given params {limit:10, offset:0}
    Given path 'articles'
    And retry until response.articles[5].favoritesCount == 1
    When method Get
    Then status 200

  @debug
  Scenario: Sleep call
      * def sleep = function(pause) {java.lang.Thread.sleep(pause)}
      Given params {limit:10, offset:0}
      Given path 'articles'
      When method Get
      * eval sleep(10000)
      Then status 200