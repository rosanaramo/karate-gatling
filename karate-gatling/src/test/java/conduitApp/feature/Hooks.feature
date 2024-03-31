@debug
Feature: Hooks

  Background: hooks
    #Background commands execute before each scenario
    #using the callonce the method will run just once for feature instead of running after each scenario
    # callonce is only for the feature call single is for init something for whole suit
    #using call single will execute only once for the whole suite it is recommended to put methods like this on karate-config file
  * def result = callonce read('classpath:helpers/Dummy.feature')
  * def username = result.username

    #after hooks
  * configure afterFeature = function (){karate.call('classpath:helpers/Dummy.feature')}

  Scenario: First scenario
    * print username
    * print 'This is first scenario'

  Scenario: Second scenario
    * print 'This is second scenario'