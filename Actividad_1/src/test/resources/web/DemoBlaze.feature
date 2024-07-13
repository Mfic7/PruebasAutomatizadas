#language: es
@FEATURE_DEMOBLAZE
Característica: Validación del formulario  de Sign up de la página DemoBlaze
  Como propietario del sistema DemoBlaze
  Quiero probar el formulario de Sign up
  Para validar el buen funcionamiento de los elementos y el registro

  @DEMOBLAZE_SCENARIO_01
  Esquema del escenario: Validar los campos de texto Username y Password el formulario de DemoBlaze
    Dado que abre la página web DemoBlaze en el navegdor de "<NAVEGADOR>"
    Cuando realizamos click en el botón Sign up
    Y escribir "<USERNAME>" en el cuadro de texto Username, escribir "<PASSWORD>" en el cuadro de texto Password
    Entonces el usuario hace click en el boton Sign Up
    Y Validamos el mensaje de alerta
    Ejemplos:
      | NAVEGADOR | USERNAME | PASSWORD |
      | chrome      | Masrco   | incio    |



  @DEMOBLAZE_SCENARIO_02
  Esquema del escenario: Validar compra DemoBlaze
    Dado que abre la página web DemoBlaze en el navegdor de "<NAVEGADOR>"
    Cuando selecciona un producto
    Y clic en anadir carrito
    Y visualizar carrito y anadir compra
    Entonces completar datos formulario "<name>" "<country>" "<city>" "<credit>" "<month>" "<year>"
    Y Validamos el mensaje de de compra
    Ejemplos:
      | NAVEGADOR | name | country |city|credit|month|year|
      | chrome      | MARCOS   | Peru    |Piura| 455555000  |  1000   |2024|
