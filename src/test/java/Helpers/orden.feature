Feature: crear orden

  Background:
    Given url link + order
    * def producto = call read('classpath:Helpers/producto.feature')
    * def productId = producto.productId

    * def DataGenerator = Java.type('Utils.DataGenerate')
    * def randomCust = DataGenerator.customer()
    * def randomAddress = DataGenerator.address()
    * def randomAmount = DataGenerator.amount()

  Scenario: creacion de una nueva orden
    Given path '/new'
    And request
      """
      {
        "customer": "#(randomCust)",
        "address": "#(randomAddress)"
      }
      """
    When method POST
    Then status 201
    And def orderId = response.id
    * print '-------------------------' , orderId

     # agregar producto a la orden
    Given path orderId + '/product'
    And request
      """
      {
        "productId": "#(productId)",
        "amount": "#(randomAmount)"
       }
      """
    When method POST
    Then status 201
    And def productoId = karate.jsonPath(response, '$[0].product')
    * print '-------------------------' , productoId