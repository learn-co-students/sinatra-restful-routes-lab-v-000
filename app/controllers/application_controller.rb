require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end
  get '/recipes/new' do
  	erb :new
  end
  
  post '/recipes' do
  	@recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
  	@recipe.save
  	redirect "/recipes/#{Recipe.last.id}"
  end
  
  get '/recipes' do
  	erb :recipes
  end
  
  get '/recipes/:id' do
  	@recipe = Recipe.find(params[:id])
  	erb :recipe	
  end
  
  delete '/recipes/:id/delete' do
  	Recipe.find(params[:id]).destroy
  end
  
  get '/recipes/:id/edit' do
  	@recipe = Recipe.find(params[:id])
  	erb :edit	
  end
  
  patch '/recipes/:id' do
  @recipe = Recipe.find(params[:id])
   @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
   redirect "recipes/#{params[:id]}"
  end
end