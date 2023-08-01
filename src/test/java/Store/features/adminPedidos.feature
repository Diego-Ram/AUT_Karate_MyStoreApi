Feature: solicitud de pedido

  Background:
    Given url link + order
    * def usuario = call read('classpath:Helpers/usuario.feature')
    * def token = usuario.token

    * def order = call read('classpath:Helpers/orden.feature')
    * def orderId = order.orderId

  Scenario: solicitud e informacion del pedido realizado
    Given path orderId + '/place'
    And header Authorization = 'Bearer ' + token
    When method POST
    Then status 201

    Given path '/my'
    And header Authorization = 'Bearer ' + token
    When method GET
    Then status 200
    * match response.orders[0].status == 'ordered'