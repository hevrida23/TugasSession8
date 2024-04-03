Feature: Recipes

  Background:
    * url 'https://api.spoonacular.com/recipes'
    * def apiKey = '11736445b1d24b1ca1b8e120afc4d5c4'
    * def username = 'vrida2323'
    * def hash = '41f2345805c96ad7c42501503dfefca788fcc897'
  @test1
  Scenario: Search Recipes
    Given path 'complexSearch'
    And header Content-type = 'application/json'
    And param apiKey = apiKey
    And param Query = 'italian'
    And param maxFat = '100'
    And param number = '5'
    When method GET
    Then status 200
    And print 'Response:', response
    And match response.results[*].id contains 715415
    * def searchResponse = response
    * def id1 = searchResponse.results[0].id

  @test2
  Scenario: Get Recipe Information
    * def id2 = call read('recipes.feature@test1')
    * def id = id2.searchResponse.results[0].id
    Given path id, 'information'
    And header Content-type = 'application/json'
    And param apiKey = apiKey
    And param includeNutrition = 'false'
    When method GET
    Then status 200
    And print 'Response:', response
  @test3
  Scenario: Get Similar Recipes
    * def id2 = call read('recipes.feature@test1')
    * def id = id2.searchResponse.results[0].id
    Given path id, 'similar'
    And header Content-type = 'application/json'
    And param apiKey = apiKey
    When method GET
    Then status 200
    And print 'Response:', response
  @test4
  Scenario: Taste by ID
    * def id2 = call read('recipes.feature@test1')
    * def id = id2.searchResponse.results[0].id
    Given path id, 'tasteWidget.json'
    And header Content-type = 'application/json'
    And param apiKey = apiKey
    And param normalize = 'false'
    When method GET
    Then status 200
    And print 'Response:', response
  @test5
  Scenario: Get Nutrition Widget for a Specific Recipe
    Given path '1003464', 'nutritionWidget.json'
    And param apiKey = apiKey
    When method GET
    Then status 200
  @test6
  Scenario: Create Recipe Analysis
    Given path 'analyze'
    And param apiKey = apiKey
    And request {title: 'Spaghetti Carbonara', ingredients: 'spaghetti, bacon, eggs, parmesan cheese, black pepper'}
    And header Content-Type = 'application/json'
    When method POST
    Then status 200
    And print 'Response:', response

  @test7
  Scenario: Guess Nutrition by Dish Name
    Given path 'guessNutrition'
    And header Content-type = 'application/json'
    And param apiKey = apiKey
    And param title = 'cheese burger'
    When method GET
    Then status 200
    And print 'Response:', response


@test8
  Scenario: Get Recipe Price Breakdown Widget
    Given path '1003464', 'priceBreakdownWidget.json'
    And param apiKey = apiKey
   And header Content-Type = 'application/json'
    When method GET
    Then status 200
    And print 'Response:', response

  @test9
  Scenario: Get Recipe Summary
    Given path '4632/summary'
    And param apiKey = apiKey
    And header Content-Type = 'application/json'
    When method GET
    Then status 200
    And print 'Response:', response
@test@10
  Scenario: Get Classify Cuisine
    Given path 'cuisine'
    And param apiKey = apiKey
    And request { cuisine: 'pasta' }
    And header Content-Type = 'application/json'
    When method POST
    Then status 200
    And print 'Response:', response

