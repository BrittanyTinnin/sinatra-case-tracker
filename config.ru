require './config/environment'



use Rack::MethodOverride

use CasesController
use UsersController
run ApplicationController

