require './config/environment'

use Rack::MethodOverride
use DecksController
use UsersController

run ApplicationController
