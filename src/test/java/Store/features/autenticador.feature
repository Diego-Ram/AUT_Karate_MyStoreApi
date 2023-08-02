Feature: El usuario debe acutenticarse

  Background:
    Given url link + auth
    * def usuario = call read('classpath:Helpers/usuario.feature')
    * def token = usuario.token


 # usuario autenticado
  Scenario: autenticar autenticado
    Given path '/me'
    And header Authorization = 'Bearer ' + token
    When method GET
    Then status 200
    * match response.status == 'active'


    # usuario no autenticado con basic auth
  Scenario: usuario no autenticado con basic auth
    Given path '/me'
    And headers {Accept:'application/json',Authorization : 'Bearer sxgsfgadsfgscsdacasg'};
    When method GET
    Then status 401
    * match response.message == 'Unauthorized'

