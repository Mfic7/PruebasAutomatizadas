function fn() {
    karate.configure('ssl', true);

    var urlReqres = '';

    var env = karate.env;

    karate.log('Se realizó la ejecución en el ambiente: ', env);

 if (!env) {
     env = 'dev';
 }
 if (env === 'dev') {


 } else if (env === 'cert') {

    urlReqres = 'https://reqres.in/'
    urlPrueba='https://petstore.swagger.io/v2/'

 }

 var config = {
    env: env,

    urlReqres: urlReqres

 }

 return config;
 }