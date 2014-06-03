config = require './config'
AppController = require './controllers/app_controller'
CounterController = require './controllers/counter_controller'

@appController = AppController.run(config)

@counter = new CounterController()