require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
 
  get '/recipes/new' do 
    erb :new
  end
  
  # Read - Index action
  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end
  
  # Create
  post '/recipes' do 
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  # Show action - displays one recipe post based on ID in the URL 
  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show
  end
 
  # load edit form 
  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  # Edit action
  patch '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end


  # Delete Action
  delete '/recipes/:id/delete' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    redirect to "/recipes"
  end


end