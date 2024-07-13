@ReqresApi
Feature: ESCUELA DE APIS AUTOMATICAS NTT

  Background:
    Given url urlReqres
    * def bodyUser = read('classpath:requestBody/bodyUser.json')
    * def bodyCuenta = read('classpath:requestBody/bodyCuenta.json')
    * def data = Java.type('Util.DataGenerada')
    * def usuarios = read('classpath:usuariosRegistrados/usuarios.json')

#01 - PRUEBA GET LISTA USUARIOS

  #CASO HAPPYPATH
  @prueba1-1 @happy
  Scenario Outline: Happy Path GET LIST USERS
    And path 'api/users'
    And params {page:<pageNumber>}
    And header Accept = '*/*'
    When method GET
    Then status 200
    * print response
    * match response.page == '#number'
    * match response.page == <pageNumber>
    Examples:
      | pageNumber |
      | 1          |
      | 2          |
      | 3          |
      | 4          |

  #CASO UNHAPPYPATH
  @prueba1-2 @unhappy
  Scenario Outline: UnHappy Path GET LIST USERS
    And path 'apis/users##'
    And params {page:<pageNumber>}
    And header Accept = '*/*'
    When method GET
    Then status 404
    * print response
    Examples:
      | pageNumber |
      | 1          |
      | 2          |
      | 3          |
      | 4          |

#02 - PRUEBA GET USUARIOS

  #CASO HAPPYPATH
  @prueba2-1 @happy
  Scenario Outline: Happy Path GET SINGLE USER
    And path 'api/users/<id>'
    And header Accept = '*/*'
    When method GET
    Then status 200
    * print response.data
    * match response.data.id == '#number'
    * match response.data.id == <id>
    * match response.data.email == '#string'
    * match response.data.first_name == '#string'
    * match response.data.last_name == '#string'
    * match response.data.avatar == '#string'
    Examples:
    | id |
    | 1 |
    | 2 |
    | 3 |
    | 4 |

  #CASO UNHAPPYPATH
  @prueba2-2 @unhappy
  Scenario Outline: UnHappy Path GET SINGLE USER NOT FOUND
    And path 'api/users/<id>'
    And header Accept = '*/*'
    When method GET
    Then status 404
    * print response
    * match response == {}
    Examples:
      | id |
      | 21 |
      | 22 |
      | 23 |
      | 24 |

#03 - PRUEBA GET SINGLE

  #CASO HAPPYPATH
  @prueba3-1 @happy
  Scenario Outline: Happy Path GET SINGLE (RESOURCE)
    And path 'api/unknown/<id>'
    And header Accept = '*/*'
    When method GET
    Then status 200
    * print response.data
    * match response.data.id == '#number'
    * match response.data.id == <id>
    * match response.data.name == '#string'
    * match response.data.year == '#number'
    * match response.data.color == '#string'
    * match response.data.pantone_value == '#string'
    Examples:
      | id |
      | 1 |
      | 2 |
      | 3 |
      | 4 |

  #CASO UNHAPPYPATH
  @prueba3-2 @unhappy
  Scenario Outline: UnHappy Path GET SINGLE (RESOURCE) NOT FOUND
    And path 'api/unknown/<id>'
    And header Accept = '*/*'
    When method GET
    Then status 404
    * print response
    * match response == {}
    Examples:
      | id |
      | 21 |
      | 22 |
      | 23 |
      | 24 |

#04 - PRUEBA POST USUARIO

  #CASO HAPPYPATH
  @prueba4-1 @happy
  Scenario Outline: Happy Path Post Usuario
    And path 'api/users'
    And header Accept = '*/*'
    And request bodyUser
    * set bodyUser.name = data.getNombre()
    * set bodyUser.job = data.getTrabajo()
    When method POST
    Then status 201
    * print response
    * match response.name == bodyUser.name
    * match response.job == bodyUser.job
    * match response.name == '#string'
    * match response.job == '#string'
    * match response.id == '#string'
    * match response.createdAt == '#string'
    Examples:
      | nombre  | trabajo  |
      | nombre1 | trabajo1 |
      | nombre2 | trabajo2 |
      | nombre3 | trabajo3 |
      | nombre4 | trabajo4 |

  #CASO UNHAPPYPATH
  @prueba4-2 @unhappy
  Scenario Outline: UnHappy Path Post Usuario
    And path 'apis/users'
    And header Accept = '*/*'
    And request bodyUser
    * set bodyUser.name = data.getNombre()
    * set bodyUser.job = data.getTrabajo()
    When method POST
    Then status 404
    * print response
    Examples:
      | nombre  | trabajo  |
      | nombre1 | trabajo1 |
      | nombre2 | trabajo2 |
      | nombre3 | trabajo3 |
      | nombre4 | trabajo4 |

#05 - PRUEBA POST CUENTA

  #CASO HAPPYPATH
  @prueba5-1 @happy
  Scenario Outline: Happy Path POST REGISTER SUCCESSFUL
    And path 'api/register'
    And header Accept = '*/*'
    And request bodyCuenta
    * set bodyCuenta.email = '<correo>'
    * set bodyCuenta.password = '<contrasena>'
    When method POST
    Then status 200
    * print response
    * match response.id == '#number'
    * match response.token == '#string'
    Examples:
      | correo | contrasena |
      | george.bluth@reqres.in  | 11111 |
      | janet.weaver@reqres.in | 2222 |
      | emma.wong@reqres.in | 3333 |
      | eve.holt@reqres.in | 4444 |

  #CASO UNHAPPYPATH
  @prueba5-2 @unhappy
  Scenario Outline: UnHappy Path POST REGISTER UNSUCCESFUL
    And path 'api/register'
    And header Accept = '*/*'
    And request bodyCuenta
    * set bodyCuenta.email = '<correo>'
    * set bodyCuenta.password = '<contrasena>'
    When method POST
    Then status 400
    * print response
    * match response.error == '#string'
    * match response.error == 'Note: Only defined users succeed registration'
    Examples:
      | correo | contrasena |
      | correo1@gmail.com | 1111 |
      | correo2@gmail.com | 2222 |
      | correo3@gmail.com | 3333 |
      | correo4@gmail.com | 4444 |

#06 - PRUEBA POST CUENTA

  #CASO HAPPYPATH
  @prueba6-1 @happy
  Scenario Outline: Happy Path LOGIN SUCCESSFUL
    And path 'api/login'
    And header Accept = '*/*'
    And request bodyCuenta
    * set bodyCuenta.email = '<correo>'
    * set bodyCuenta.password = '<contrasena>'
    When method POST
    Then status 200
    * print response
    * match response.token == '#string'
    Examples:
      | correo | contrasena |
      | george.bluth@reqres.in | 1111 |
      | janet.weaver@reqres.in | 2222 |
      | emma.wong@reqres.in | 3333 |
      | eve.holt@reqres.in | 4444 |

  #CASO UNHAPPYPATH
  @prueba6-2 @unhappy
  Scenario Outline: UnHappy Path POST REGISTER UNSUCCESSFUL (NO PASSWORD)
    And path 'api/login'
    And header Accept = '*/*'
    And request bodyCuenta
    * set bodyCuenta.email = '<correo>'
    * set bodyCuenta.password = <contrasena>
    When method POST
    Then status 400
    * print response
    * match response.error == '#string'
    * match response.error == 'Missing password'
    Examples:
      | correo | contrasena |
      | george.bluth@reqres.in | null |
      | janet.weaver@reqres.in | null |
      | emma.wong@reqres.in | null |
      | eve.holt@reqres.in | null |

#07 - PRUEBA GET LISTA RESOURCES

  #CASO HAPPYPATH
  @prueba7-1 @happy
  Scenario Outline: Happy Path GET LIST RESOURCES
    And path 'api/unknown'
    And params {page:<pageNumber>}
    And header Accept = '*/*'
    When method GET
    Then status 200
    * print response
    * match response.page == '#number'
    * match response.page == <pageNumber>
    Examples:
      | pageNumber |
      | 1          |
      | 2          |
      | 3          |
      | 4          |

  #CASO UNHAPPYPATH
  @prueba7-2 @unhappy
  Scenario Outline: UnHappy Path GET LIST RESOURCES
    And path 'apis/unknown##'
    And params {page:<pageNumber>}
    And header Accept = '*/*'
    When method GET
    Then status 404
    * print response
    Examples:
      | pageNumber |
      | 1          |
      | 2          |
      | 3          |
      | 4          |

#08 - PRUEBA PUT USUARIO

  #CASO HAPPYPATH
  @prueba8-1 @happy
  Scenario Outline: Happy Path Put Usuario Update
    And path 'api/users/<id>'
    And header Accept = '*/*'
    And request bodyUser
    * set bodyUser.name = data.getNombre()
    * set bodyUser.job = data.getTrabajo()
    When method PUT
    Then status 200
    * print response
    * match response.name == bodyUser.name
    * match response.job == bodyUser.job
    * match response.name == '#string'
    * match response.job == '#string'
    * match response.updatedAt == '#string'
    Examples:
      |id | nombre  | trabajo  |
      |1  | nombre1 | trabajo1 |
      |2  | nombre2 | trabajo2 |
      |3  | nombre3 | trabajo3 |
      |4  | nombre4 | trabajo4 |

  #CASO UNHAPPYPATH
  @prueba8-2 @unhappy
  Scenario Outline: UnHappy Path Put Usuario Update
    And path 'apis/users/<id>'
    And header Accept = '*/*'
    And request bodyUser
    * set bodyUser.name = data.getNombre()
    * set bodyUser.job = data.getTrabajo()
    When method POST
    Then status 404
    * print response
    Examples:
      |id | nombre  | trabajo  |
      |1  | nombre1 | trabajo1 |
      |2  | nombre2 | trabajo2 |
      |3  | nombre3 | trabajo3 |
      |4  | nombre4 | trabajo4 |

#09 - PRUEBA PATCH USUARIO

  #CASO HAPPYPATH
  @prueba9-1 @happy
  Scenario Outline: Happy Path Patch Usuario Update
    And path 'api/users/<id>'
    And header Accept = '*/*'
    And request bodyUser
    * set bodyUser.job = data.getTrabajo()
    When method PATCH
    Then status 200
    * print response
    * match response.job == bodyUser.job
    * match response.job == '#string'
    * match response.updatedAt == '#string'
    Examples:
      |id |
      |1  |
      |2  |
      |3  |
      |4  |

  #CASO UNHAPPYPATH
  @prueba9-2 @unhappy
  Scenario Outline: UnHappy Path Patch Usuario Update
    And path 'apis/users/<id>'
    And header Accept = '*/*'
    And request bodyUser
    * set bodyUser.name = data.getNombre()
    * set bodyUser.job = data.getTrabajo()
    When method PATCH
    Then status 404
    * print response
    Examples:
      |id |
      |1  |
      |2  |
      |3  |
      |4  |

#10 - PRUEBA DELETE USUARIO

  #CASO HAPPYPATH
  @prueba10-1 @happy
  Scenario Outline: Happy Path Delete Usuario
    And path 'api/users/<id>'
    And header Accept = '*/*'
    And request bodyUser
    When method DELETE
    Then status 204
    * print response
    * match response == ''
    Examples:
      |id |
      |1  |
      |2  |
      |3  |
      |4  |

  #CASO UNHAPPYPATH
  @prueba10-2 @unhappy
  Scenario Outline: UnHappy Path Delete Usuario
    And path 'apis/users/<id>'
    And header Accept = '*/*'
    And request bodyUser
    When method DELETE
    Then status 404
    * print response
    Examples:
      |id |
      |1  |
      |2  |
      |3  |
      |4  |

#11 - PRUEBA DELETE USUARIO

  #CASO HAPPYPATH
  @prueba11-1 @happy
  Scenario Outline: Happy Path Get Delay Request
    And path 'api/users'
    And params {delay:<delay>}
    And header Accept = '*/*'
    When method GET
    Then status 200
    * print response
    Examples:
      |delay |
      |1  |
      |2  |
      |3  |
      |4  |