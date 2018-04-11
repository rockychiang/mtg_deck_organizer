require './config/environment'

use Rack::MethodOverride
use DeckController

run ApplicationController
