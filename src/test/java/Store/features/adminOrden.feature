Feature: obtener o cancelar una orden creada


  Background:
    Given url link + order
    * def orden = call read('classpath:Helpers/orden.feature')
    * def orderId = orden.orderId
    * def productoId = orden.productoId

  Scenario: optener orden creada
    Given path '/' + orderId
    When method GET
    Then status 200
    * match response ==
    """
        {
        "order": {
          "id": "#number",
          "created": "#string",
          "customer": "#string",
          "address": "#string",
          "status": "#string",
          "user": "#ignore"
        },
        "items": [{
                  "id":"#number",
                  "name":"#string",
                  "category":"#string",
                  "price":"#number",
                  "amount":"#number"
                  }],
        "summary": {
          "totalCost": "#number",
          "totalItems": "#number"
        }
      }
    """

  @Smoke
  Scenario: eliminar orden creada
    * print '-------------------------' , orderId
    Given path '/' + orderId
    When method DELETE
    Then status 200
    * match response.status == 'deleted'

  @Smoke
  Scenario: eliminar orden con producto
    * print '-------------------------' , productoId
    Given path '/' + orderId + product + '/' + productoId
    When method DELETE
    Then status 200


