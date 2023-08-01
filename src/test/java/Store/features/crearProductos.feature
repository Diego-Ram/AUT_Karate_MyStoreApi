Feature: crear uno o varios productos

  Background:
    Given url link + catalog

    * def DataGenerator = Java.type('Utils.DataGenerate')
    * def randomName = DataGenerator.nameProduct()
    * def randomManu = DataGenerator.manufacturer()
    * def randomCat = DataGenerator.category()
    * def randomDesc = DataGenerator.description()
    * def randomTags = DataGenerator.tags()

  @Smoke
  # crear productos
  Scenario Outline: crear varios productos
   * eval getRandomPrice = function() { return Math.floor((100) * Math.random()); }
   * def random_price = getRandomPrice()
    * print '------------------>', random_price
    Given path '/product'
    And request
      """
      {
        "name": <name>,
        "price": <price>,
        "manufacturer": <manufacturer>,
        "category": <category>,
        "description": <description>,
        "tags": <tags>
      }
      """
    When method POST

    Examples:
      |caso |name         |price              |manufacturer |category    |description  |tags         |
      |01   |#(randomName)|#(random_price)  |#(randomManu)|#(randomCat)|#(randomDesc)|#(randomTags)|
      |03   |test         |#(random_price)               |#(randomManu)|#(randomCat)|#(randomDesc)|#(randomTags)|

  @Smoke
  Scenario Outline: crear varios productos desde un .csv
    Given path '/product'
    And request
      """
      {
        "name": <name>,
        "price": <price>,
        "manufacturer": <manufacturer>,
        "category": <category>,
        "description": <description>,
        "tags": <tags>
      }
      """
    When method POST

    Examples:
      |read("classpath:Resources/testData.csv")|