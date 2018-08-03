require './config/environment'

=begin
if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
=end

use Rack::MethodOverride
run ApplicationController
