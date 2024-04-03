function fn(){
    //define environment
    var env = karate.env;
    karate.log('karate.env system property was:', env);
    if (!env){
        env = 'dev';
    }
    var config = {
        env: env
    }
    karate.configure('connectTimout',3000);
    karate.configure('readTimeout',3000);
    return config;
}