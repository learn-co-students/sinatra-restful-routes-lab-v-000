require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride #need this line here to use PATCH, PUT, DELETE requests in the following controller:

run ApplicationController
