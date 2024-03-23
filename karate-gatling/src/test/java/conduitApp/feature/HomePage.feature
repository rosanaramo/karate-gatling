# https://conduit.productionready.io/api/tags

  Feature: Tests for the home page

    Background: Define URL
      Given url 'https://conduit.productionready.io/api'


#      Scenario: Get all the tags
#      Given path 'tags'
#      When method Get
#      Then status 200
#      And match response.tags contains ['est','ipsum']
#      And match response.tags !contains 'estou'
#      And match response.tags == "#array"
#      And match each response.tags == "#string"

    #Using a object of parameters or single parameter
      Scenario: Get 10 scenarios from the page
        #Given param limit = 10
        #Given param offset = 0
        Given path 'articles'
        Given params {limit:10, offset:0}
        And method Get
        Then status 200
        And match response.articles =='#[10]'
        And match response.articlesCount == 251

