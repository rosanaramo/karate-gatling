# https://conduit.productionready.io/api/tags

  Feature: Tests for the home page

#    Scenario: Get all the tags
#      Given url 'https://conduit.productionready.io/api/tags'
    #Given path 'tags'
#      When method Get
#      Then status 200

    #Using a object of parameters or single parameter
      Scenario: Get 10 scenarios from the page
        #Given param limit = 10
        #Given param offset = 0
        Given path 'tags'
        Given params {limit:10, offset:0}
        Given url 'https://conduit.productionready.io/api'
        And method Get
        Then status 200