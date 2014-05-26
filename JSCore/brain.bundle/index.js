var AppController, config;

config = require('./config');

AppController = require('./controllers/app_controller');

console.log(AppController.run(config).currentState());
