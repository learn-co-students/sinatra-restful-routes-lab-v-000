require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/recipes' do
    erb :index
  end
  
  get '/recipes/new' do
    erb :new 
  end
  
  post '/recipes' do
    @recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save
    
  end
end