# https://conduit.productionready.io/api/tags

  Feature: Tests for the home page

#    Scenario: Get all the tags
#      Given url 'https://conduit.productionready.io/api/tags'
#      When method Get
#      Then status 200

      Scenario: Get 10 scenarios from the page
        #Given param limit = 10
        #Given param offset = 0
        Given params {limit:10, offset:0}
        Given url 'https://conduit.productionready.io/api/articles'
        And method Get
        Then status 200