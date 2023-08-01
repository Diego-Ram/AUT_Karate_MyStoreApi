Feature: eliminar y mostrar productos creados

  Background:
    Given url link + catalog + product
    * def producto = call read('classpath:Helpers/producto.feature')
    * def productId = producto.productId

  Scenario: mostrar producto creado
    Given path '/' + productId
    When method GET
    Then status 200
    * match response.created == '#present'

  Scenario: Eliminar producto creado
    Given path '/' + productId
    When method DELETE
    Then status 200
    * match response.status == 'deleted'

