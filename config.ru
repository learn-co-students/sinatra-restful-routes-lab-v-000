require './config/environment'


if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

configure :development do
set :show_exceptions, :after_handler
end

use Rack::MethodOverride
run ApplicationController
