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

  get '/recipes' do 
    @recipes = Recipe.all
    erb :recipes
  end

  post '/recipes' do 
    @recipe = Recipe.new(:name => params["recipe_name"], :ingredients => params["recipe_ingredients"], :cook_time => params["cook_time"])
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end


  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit 
  end

  patch '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params["recipe_name"]
    @recipe.ingredients = params["recipe_ingredients"]
    @recipe.cook_time = params["cook_time"]
    @recipe.save

    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do #delete action
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.delete
  
  redirect to '/recipes'
end




end