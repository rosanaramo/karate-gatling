Feature: Hooks

  Background: hooks
    #executes before each scenario
  * def result = call read('classpath:helpers/Dummy.feature')
  * def username = result.username

  @debug
  Scenario: First scenario
    * print 'This is first scenario'

  Scenario: Second scenario
    * print 'This is second scenario'