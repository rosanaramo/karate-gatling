Feature: Tests for the home page

    Background: Pre conditions
     # Given url 'https://conduit.productionready.io/api'
     # https://conduit.productionready.io/api/tags
      Given url  apiUrl
      * def isValidTime = read ('classpath:/helpers/timeValidator.js')

      Scenario: Get all the tags
        Given path 'tags'
        When method Get
        Then status 200
        And match response.tags contains ['Git','GitHub']
        And match response.tags contains any ['Git','GitHub']
        And match response.tags !contains 'twitter'
#      And match response.tags !contains only 'GitHub'
#      And match response.tags !contains only [GitHub, YouTube]
        And match response.tags == "#array"
        And match each response.tags == "#string"

      Scenario: Get 10 scenarios from the page
        #Using a object of parameters or single parameter
        #Given param limit = 10
        #Given param offset = 0
        Given path 'articles'
        Given params {limit:10, offset:0}
        And method Get
        Then status 200
        And match response.articles != '#[50]'
        And match response.articlesCount != 250
#        And match response == {"articles": "#array", "articlesCount" ==500}
        And match response.articles[0].createdAt contains '2024'
    #asterisk key means each object on json
        And match response.articles[*].favoritesCount contains 0
#    at least on of the objects should contains null
        And match response.articles[*].author.bio contains null
#    karate will find all bios no matter where they are located
        And match response..bio contains null
        And match each response.articles[*].author.following == false
        And match each response..following == false

       Scenario: Testing fuzzy matching
        Given path 'articles'
        Given params {limit:10, offset:0}
        And method Get
        Then status 200
        And match each response..following == '#boolean'
        And match each response.articles[*].favoritesCount == '#number'
#    double hash sign means it accept null or other type of value
#    if I change the double for a single hash sign I will face an error because some values are null
        And match each response..bio == '##string"


        Scenario: Testing schema validation
          Given path 'articles'
          And params {limit:10, offset:0}
          And method Get
          Then status 200
          And match each response.articles ==
          """
          {
                  "slug": "#string",
                  "title": "#string",
                  "description": "#string",
                  "body": "#string",
                  "tagList": "#array",
                  "createdAt": "#? isValidTime(_)",
                  "updatedAt": "#? isValidTime(_)",
                  "favorited": false,
                  "favoritesCount": "#number",
                  "author": {
                      "username": "#string",
                      "bio": "##string",
                      "image": "#string",
                      "following": '#boolean'
                  }
              }
          """