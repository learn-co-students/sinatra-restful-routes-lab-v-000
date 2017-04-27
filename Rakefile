ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'
require 'irb'

# Type `rake -T` on your command line to see the available rake tasks.

task :console do
	ARGV.clear
  IRB.start
end
