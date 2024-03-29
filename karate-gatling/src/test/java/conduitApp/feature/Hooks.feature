Feature: Hooks

  Background: hooks
    #executes before each scenario
    #using the callonce the method will run just once instead of running after each scenario
  * def result = callonce read('classpath:helpers/Dummy.feature')
  * def username = result.username

    #after hooks
  * configure afterFeature = function (){karate.call('classpath:helpers/Dummy.feature')}

  @debug
  Scenario: First scenario
    * print username
    * print 'This is first scenario'

  Scenario: Second scenario
    * print 'This is second scenario'