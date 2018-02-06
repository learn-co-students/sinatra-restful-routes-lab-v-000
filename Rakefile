ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'
require 'pry'

# Type `rake -T` on your command line to see the available rake tasks.

desc 'start rake console'
task :console do
  Pry.start
end
