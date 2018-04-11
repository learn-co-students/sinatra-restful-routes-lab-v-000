require './config/environment'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

use Rack::MethodOverride #USING PATCH, PUT AND DELETE REQUESTS WITH RACK::METHODOVERRIDE MIDDLEWARE, must be placed above all controllers in which you want access to the middleware's functionality. This middleware will then run for every request sent by our application. It will interpret any requests with name="_method" by translating the request to whatever is set by the value attribute. 

run ApplicationController
