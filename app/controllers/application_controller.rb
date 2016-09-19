require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do
  	@recipes = Recipe.all
  	erb :index
  	# binding.pry
  end

  get '/recipes/:id' do
  end

  get '/recipes/:id/edit' do
  end
end