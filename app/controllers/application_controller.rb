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
    redirect "/recipes/#{Recipe.last.id}"
  end
  
  get '/recipes/:id' do
    @current_recipe = Recipe.find_by_id(params[:id])
    erb :show 
  end
  
  get '/recipes/:id/edit' do
    @current_recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end 
  
  patch '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end
    
  delete '/recipes/:id' do
    Recipe.find_by_id(params[:id]).destroy
    redirect '/recipes'
  end
  
end