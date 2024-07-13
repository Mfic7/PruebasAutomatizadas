package com.bdd.page;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.sikuli.script.Screen;
import net.serenitybdd.core.environment.EnvironmentSpecificConfiguration;
import net.thucydides.core.annotations.DefaultUrl;
import net.thucydides.core.pages.PageObject;
import net.thucydides.core.reports.remoteTesting.BrowserStackLinkGenerator;
import org.junit.Assert;
import org.openqa.selenium.Alert;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.sikuli.script.FindFailed;
import org.sikuli.script.Pattern;

import java.sql.Driver;

@DefaultUrl("https://www.demoblaze.com/")
public class DemoBlazePage extends PageObject {
    WebDriverWait wait;


    // localizadores

    @FindBy(xpath = "//a[@id='signin2']")
    WebElement btnSignUp;

    @FindBy(xpath= "//input[@id='sign-username']")
    WebElement TxtUsername;
    @FindBy(xpath = "//input[@id='sign-password']")
    WebElement TxtPassword;

    @FindBy (xpath = "//button[@onclick='register()']")
    WebElement BtnRegistar;

    @FindBy (xpath = "//a[contains(text(),'Samsung galaxy s6')]")
    WebElement seleccionarproducto;

    @FindBy (xpath = "//a[contains(text(),'Add to cart')]")
    WebElement anadircarrito;

    @FindBy (xpath = "//a[contains(text(),'Cart')]")
    WebElement cart;
    @FindBy (xpath = "//button[contains(.,'Place Order')]")
    WebElement placeorder;

    @FindBy (xpath = "//input[@id='name']")
    WebElement  Txtname;
    @FindBy (xpath = "//input[@id='country']")
    WebElement  Txtcountry;
    @FindBy (xpath = "//input[@id='city']")
    WebElement  Txtcity;
    @FindBy (xpath = "//input[@id='card']")
    WebElement Txtcard;
    @FindBy (xpath = "//input[@id='month']")
    WebElement  Txtmonth;
    @FindBy (xpath = "//input[@id='year']")
    WebElement  Txtyear;
    @FindBy (xpath = "//button[contains(text(),'Purchase')]")
    WebElement btnPurchase;
    @FindBy (xpath = "//button[contains(text(),'OK')]")
    WebElement btnOK;
    @FindBy (xpath = "//body/nav[1]/div[1]/div[1]/ul[1]/li[1]/a[1]")
    WebElement PageHome;
    @FindBy (xpath = "//a[contains(text(),'Nokia lumia 1520')]")
    WebElement OtroProducto;

    @FindBy (xpath = "//h2[contains(text(),'Thank you for your purchase!')]")
    WebElement Mesanje;








    // clases
      public void queAbreLaPáginaWebDemoBlazeEnElNavegdorDe(String navegador) {

          Browser.Start(this, navegador);
          wait = new WebDriverWait(getDriver(), 50);


    }


    public void realizamosClickEnElBotónSignUp() {
          Browser.ClickJS(this, btnSignUp);
    }

    public void escribirEnElCuadroDeTextoUsernameEscribirEnElCuadroDeTextoPassword(String username, String password) {
        TxtUsername.sendKeys(username);
         TxtPassword.sendKeys(password);

    }

    public void elUsuarioHaceClickEnElBotonSignUp() {
        Browser.ClickJS(this, BtnRegistar);
            }


    public void validamosElMensajeDeAlerta() throws InterruptedException {

        Screen s = new Screen();
        try {
            Pattern image = new Pattern("C:/Users/Incio/Desktop/automatizacion/ESCUELA-0822-[MARCOS INCIO CASTILLO] (1)/Actividad1/Actividad_1/src/main/resources/botonLogin.png");
            s.click(image);
        } catch (FindFailed e) { e.printStackTrace();

        }

        Thread.sleep(5);

    }

    public void elUsuarioAceptaLaAlerta() {

        Alert alert = this.getDriver().switchTo().alert();
        alert.accept();
    }



    public void seleccionarproductos() {
        wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//a[contains(text(),'Samsung galaxy s6')]"))) ;
        Browser.ClickJS(this, seleccionarproducto);
    }

    public void anadircarrito() throws InterruptedException {
        wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//a[contains(text(),'Add to cart')]"))) ;
        Browser.ClickJS(this, anadircarrito);
        validamosElMensajeDeAlerta();



    }
    public void producob ()  throws InterruptedException {
        Browser.ClickJS(this,PageHome);
        wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//a[contains(text(),'Nokia lumia 1520')]"))) ;
        Browser.ClickJS(this,OtroProducto);
        wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//a[contains(text(),'Add to cart')]"))) ;
        Browser.ClickJS(this, anadircarrito);

    }


    public void visualizarcarrito()  throws InterruptedException{

        producob ();
        wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//a[contains(text(),'Cart')]"))) ;
        Browser.ClickJS(this, cart);
        Browser.ClickJS(this, placeorder);

    }



    public void validarmensaje() throws InterruptedException {

        String txt2="Thank you for your purchase!";

        wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//button[contains(text(),'OK')]"))) ;
        Thread.sleep(5000);
        //txt1Element = getDriver().findElement(By.xpath("//div[10]/h2"));
        String txt1 = getDriver().findElement(By.xpath("//div[10]/h2")).getText();
        System.out.println(txt1);
       // Obtén el texto del elemento
        Assert.assertEquals(txt2,txt1);
        Browser.ClickJS(this, btnOK);
    }

    public void completardato(String name, String country, String city, String credit, String month, String year) {

        wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//input[@id='name']"))) ;
        Browser.ClickJS(this, Txtname);
        Txtname.sendKeys(name);
        Browser.ClickJS(this, Txtcountry);
        Txtcountry.sendKeys(country);
        Browser.ClickJS(this, Txtcity);
        Txtcity.sendKeys(city);
        Browser.ClickJS(this, Txtcard);
        Txtcard.sendKeys(credit);
        Browser.ClickJS(this, Txtmonth);
        Txtmonth.sendKeys(month);
        Browser.ClickJS(this, Txtyear);
        Txtyear.sendKeys(year);
        Browser.ClickJS(this, btnPurchase);


    }
}
