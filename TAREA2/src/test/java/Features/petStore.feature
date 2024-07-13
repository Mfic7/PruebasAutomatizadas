@PetStore
Feature: ESCUELA DE APIS AUTOMATICAS NTT

  Background:
    Given url urlPrueba
    * def bodyPerStore = read('classpath:requestBody/bodyPerStore.json')
    * def data = Java.type('Util.DataGenerada')

#01 - PRUEBA GET LISTA USUARIOS

  #CASO HAPPYPATH CREAR UN USUARIO
  @CREARUSUARIO-1 @happy
  Scenario Outline: Happy CREAR USUARIO
    And path 'user'
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request bodyPerStore
    * set bodyPerStore.id = <id>
    When method POST
    Then status 200
    * print response
    * match response.message == karate.toString(bodyPerStore.id)

    Examples:
      | id  |
      |  50|


 #CASO HAPPYPATH
  @buscarusario
  Scenario Outline: buscar usuario por nombre
    And path 'user/<username>'
    And header Accept = '*/*'
    When method GET
    Then status 200
    * print response
    * match response.username == username
    Examples:
      | username |
      |  Marcos  |

 #CASO HAPPYPATH
  @cambiarDatos
  Scenario Outline: Happy Path Put Usuario Update
    And path 'user/<username>'
    And header Accept = '*/*'
    And request bodyPerStore
    * set bodyPerStore.id = <id>
    * set bodyPerStore.username =  "<username>"
    *  set bodyPerStore.email = "<email>"
    When method PUT
    Then status 200
    * print response
    * match response.message == karate.toString(bodyPerStore.id)
    Examples:
      |id | username  | email  |
      |51  | MarcosF | marco@gmail.com |

 #CASO HAPPYPATH
  @buscarActulizar
  Scenario Outline: buscar usuario por nombre
    And path 'user/<username>'
    And header Accept = '*/*'
    When method GET
    Then status 200
    * print response
    * match response.username == username
    Examples:
      | username |
      |  MarcosF  |

  @Eliminar
  Scenario Outline: Happy Path Delete Usuario
    And path 'user/<username>'
    And header Accept = '*/*'
    And request bodyPerStore
    When method DELETE
    Then status 200
    * print response
    * match response.message == username
    Examples:
      |username |
      |MarcosF  |
