@debug
Feature: Karate loops

  Scenario: Adding articles in loop
    * def articles = function(){karate.call('classpath:conduitApp/feature/ArticlesReadingFiles.feature')}
    * def foo = karate.repeat(3, articles)