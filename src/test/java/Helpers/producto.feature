Feature: crear uno o varios productos

  Background:
    Given url link + catalog
    * def DataGenerator = Java.type('Utils.DataGenerate')
    * def randomName = DataGenerator.nameProduct()
    * def randomPrice = DataGenerator.price()
    * def randomManu = DataGenerator.manufacturer()
    * def randomCat = DataGenerator.category()
    * def randomDesc = DataGenerator.description()
    * def randomTags = DataGenerator.tags()


    # crear producto
  Scenario: crear un producto
    Given path '/product'
    And request
      """
      {
        "name": "#(randomName)",
        "price": "#(randomPrice)",
        "manufacturer": "#(randomManu)",
        "category": "#(randomCat)",
        "description": "#(randomDesc)",
        "tags": "#(randomTags)"
      }
      """
    When method POST
    Then status 201
    And def productId = response.id

