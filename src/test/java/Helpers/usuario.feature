Feature: sample karate test script

  Background:
    Given url link + auth
    * def DataGenerator = Java.type('Utils.DataGenerate')
    * def randomUser = DataGenerator.user()
    * def randomPass = DataGenerator.pass()

  Scenario: crear usuario y autenticar
# crear user
    Given path '/user'
    And request
      """
      {
      "username": "#(randomUser)",
      "password": "#(randomPass)"
      }
      """
    When method POST
    Then status 201
    And def userId = response.id
    And print 'El valor de userId es:', userId

#autenticar usuario
    Given path '/login'
    And request
      """
      {
      "username": "#(randomUser)",
      "password": "#(randomPass)"
      }
      """
    When method POST
    Then status 201
    And def token = response.access_token
    And print 'este es el codigo del token ->', token
