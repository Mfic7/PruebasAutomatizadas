package com.bdd.stepdefinition;

import com.bdd.step.DemoBlazeStep;
import cucumber.api.PendingException;
import cucumber.api.java.es.Cuando;
import cucumber.api.java.es.Dado;
import cucumber.api.java.es.Entonces;
import cucumber.api.java.es.Y;
import net.thucydides.core.annotations.Steps;

public class DemoBlazeStepDefinition {
    @Steps
    DemoBlazeStep demoBlazeStep;
    @Dado("^que abre la página web DemoBlaze en el navegdor de \"([^\"]*)\"$")
    public void queAbreLaPáginaWebDemoBlazeEnElNavegdorDe(String navegador) throws Throwable {
     demoBlazeStep.queAbreLaPáginaWebDemoBlazeEnElNavegdorDe(navegador);
    }

    @Cuando("^realizamos click en el botón Sign up$")
    public void realizamosClickEnElBotónSignUp() {
        demoBlazeStep.realizamosClickEnElBotónSignUp();

    }

    @Y("^escribir \"([^\"]*)\" en el cuadro de texto Username, escribir \"([^\"]*)\" en el cuadro de texto Password$")
    public void escribirEnElCuadroDeTextoUsernameEscribirEnElCuadroDeTextoPassword(String username, String password) throws Throwable {
       demoBlazeStep.escribirEnElCuadroDeTextoUsernameEscribirEnElCuadroDeTextoPassword(username,password);
    }
    @Entonces("^completar datos formulario \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void completarDatosFormulario(String name, String country, String city, String credit, String month, String year) throws Throwable {
        demoBlazeStep.completardatos(name,country,city,credit,month,year);

    }

    @Entonces("^el usuario hace click en el boton Sign Up$")
    public void elUsuarioHaceClickEnElBotonSignUp() {
        demoBlazeStep.elUsuarioHaceClickEnElBotonSignUp();

    }

    @Y("^Validamos el mensaje de alerta$")
    public void validamosElMensajeDeAlerta() throws InterruptedException {
        demoBlazeStep.validamosElMensajeDeAlerta();
    }

    @Y("^el usuario acepta la alerta$")
    public void elUsuarioAceptaLaAlerta() {
        demoBlazeStep.elUsuarioAceptaLaAlerta();
    }


    @Cuando("^selecciona un producto$")
    public void seleccionaUnProducto() {
        // seleccionar un producto
        demoBlazeStep.seleccionarproducto();
            }

    @Y("^clic en anadir carrito$")
    public void clicEnAnadirCarrito() throws InterruptedException {
        demoBlazeStep.anadircarrito();
    }

    @Y("^visualizar carrito y anadir compra$")
    public void visualizarCarritoYAnadirCompra()  throws InterruptedException {
        demoBlazeStep.visualizarcarrito();


    }



    @Y("^Validamos el mensaje de de compra$")
    public void validamosElMensajeDeDeCompra()throws InterruptedException {
        demoBlazeStep.validarmensaje();
    }
}
