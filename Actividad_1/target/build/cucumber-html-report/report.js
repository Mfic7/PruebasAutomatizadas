$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("src/test/resources/web/DemoBlaze.feature");
formatter.feature({
  "name": "Validación del formulario  de Sign up de la página DemoBlaze",
  "description": "  Como propietario del sistema DemoBlaze\n  Quiero probar el formulario de Sign up\n  Para validar el buen funcionamiento de los elementos y el registro",
  "keyword": "Característica",
  "tags": [
    {
      "name": "@FEATURE_DEMOBLAZE"
    }
  ]
});
formatter.scenarioOutline({
  "name": "Validar compra DemoBlaze",
  "description": "",
  "keyword": "Esquema del escenario",
  "tags": [
    {
      "name": "@DEMOBLAZE_SCENARIO_02"
    }
  ]
});
formatter.step({
  "name": "que abre la página web DemoBlaze en el navegdor de \"\u003cNAVEGADOR\u003e\"",
  "keyword": "Dado "
});
formatter.step({
  "name": "selecciona un producto",
  "keyword": "Cuando "
});
formatter.step({
  "name": "clic en anadir carrito",
  "keyword": "Y "
});
formatter.step({
  "name": "visualizar carrito y anadir compra",
  "keyword": "Y "
});
formatter.step({
  "name": "completar datos formulario \"\u003cname\u003e\" \"\u003ccountry\u003e\" \"\u003ccity\u003e\" \"\u003ccredit\u003e\" \"\u003cmonth\u003e\" \"\u003cyear\u003e\"",
  "keyword": "Entonces "
});
formatter.step({
  "name": "Validamos el mensaje de de compra",
  "keyword": "Y "
});
formatter.examples({
  "name": "",
  "description": "",
  "keyword": "Ejemplos",
  "rows": [
    {
      "cells": [
        "NAVEGADOR",
        "name",
        "country",
        "city",
        "credit",
        "month",
        "year"
      ]
    },
    {
      "cells": [
        "chrome",
        "MARCOS",
        "Peru",
        "Piura",
        "455555000",
        "1000",
        "2024"
      ]
    }
  ]
});
formatter.scenario({
  "name": "Validar compra DemoBlaze",
  "description": "",
  "keyword": "Esquema del escenario",
  "tags": [
    {
      "name": "@FEATURE_DEMOBLAZE"
    },
    {
      "name": "@DEMOBLAZE_SCENARIO_02"
    }
  ]
});
formatter.step({
  "name": "que abre la página web DemoBlaze en el navegdor de \"chrome\"",
  "keyword": "Dado "
});
formatter.match({
  "location": "DemoBlazeStepDefinition.queAbreLaPáginaWebDemoBlazeEnElNavegdorDe(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "selecciona un producto",
  "keyword": "Cuando "
});
formatter.match({
  "location": "DemoBlazeStepDefinition.seleccionaUnProducto()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "clic en anadir carrito",
  "keyword": "Y "
});
formatter.match({
  "location": "DemoBlazeStepDefinition.clicEnAnadirCarrito()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "visualizar carrito y anadir compra",
  "keyword": "Y "
});
formatter.match({
  "location": "DemoBlazeStepDefinition.visualizarCarritoYAnadirCompra()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "completar datos formulario \"MARCOS\" \"Peru\" \"Piura\" \"455555000\" \"1000\" \"2024\"",
  "keyword": "Entonces "
});
formatter.match({
  "location": "DemoBlazeStepDefinition.completarDatosFormulario(String,String,String,String,String,String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "Validamos el mensaje de de compra",
  "keyword": "Y "
});
formatter.match({
  "location": "DemoBlazeStepDefinition.validamosElMensajeDeDeCompra()"
});
formatter.result({
  "status": "passed"
});
});