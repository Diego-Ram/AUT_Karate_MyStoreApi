function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    link: 'https://mystoreapi.com',
    auth: '/auth',
    catalog: '/catalog',
    product: '/product',
    order: '/order'
  }

    if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }

  karate.configure('logPrettyResponse', true)
  karate.configure('logPrettyRequest', true)
  return config;
}