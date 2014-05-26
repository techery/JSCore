config = require './config'
AppController = require './controllers/app_controller'

@appController = AppController.run(config)