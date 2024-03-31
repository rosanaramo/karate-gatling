// this file is used to config environment variables and also
// used to run any code before running all tests
// we can have som javascript methods here
function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'dev') {
    config.apiUrl='https://conduit-api.bondaracademy.com/api'
    config.userEmail = 'rosanateste@gmail.com'
    config.userPassword = '99575137qwr'
  } else if (env == 'qa') {
    config.apiUrl='https://conduit-api.bondaracademy.com/api'
    config.userEmail = 'rosanatest2@gmail.com'
    config.userPassword = 'iufaufafugu'
  }
  // Using callsingle the token will be generated for the suit only once. NOT FOR EACH FEATURE.
  // if I use call instead of call single the token will be created for every scenario
  var accessToken = karate.callSingle('classpath:helpers/CreateToken.feature',config).authToken
  karate.configure('headers',{Authorization:accessToken});
  return config;
}