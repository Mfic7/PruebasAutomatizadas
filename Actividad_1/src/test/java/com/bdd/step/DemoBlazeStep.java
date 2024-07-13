package com.bdd.step;

import com.bdd.page.DemoBlazePage;
import net.thucydides.core.steps.ScenarioSteps;

public class DemoBlazeStep extends ScenarioSteps {
    DemoBlazePage demoBlazePage;


    public void queAbreLaPáginaWebDemoBlazeEnElNavegdorDe(String navegador) {
        demoBlazePage.queAbreLaPáginaWebDemoBlazeEnElNavegdorDe(navegador);
    }

    public void realizamosClickEnElBotónSignUp() {
        demoBlazePage.realizamosClickEnElBotónSignUp();
    }

    public void escribirEnElCuadroDeTextoUsernameEscribirEnElCuadroDeTextoPassword(String username, String password) {
   demoBlazePage.escribirEnElCuadroDeTextoUsernameEscribirEnElCuadroDeTextoPassword(username,password);
    }

    public void elUsuarioHaceClickEnElBotonSignUp() {
        demoBlazePage.elUsuarioHaceClickEnElBotonSignUp();
    }

    public void validamosElMensajeDeAlerta() throws InterruptedException {
        demoBlazePage.validamosElMensajeDeAlerta();
    }

    public void elUsuarioAceptaLaAlerta() {
        demoBlazePage.elUsuarioAceptaLaAlerta();
    }


    public void seleccionarproducto() {
        demoBlazePage.seleccionarproductos();
    }

    public void anadircarrito() throws InterruptedException {
        demoBlazePage.anadircarrito();
    }

    public void visualizarcarrito()  throws InterruptedException{
        demoBlazePage.visualizarcarrito();
    }

    public void completardatos(String name, String country, String city, String credit, String month, String year) {
        demoBlazePage.completardato(name,country,city,credit,month,year);
    }

    public void validarmensaje() throws InterruptedException {
        demoBlazePage.validarmensaje();
    }

}
