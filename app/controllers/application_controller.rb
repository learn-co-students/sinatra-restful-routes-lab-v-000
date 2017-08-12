require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes/new' do #This allows input for new recipe
    erb :new
  end

  get '/recipes' do # This displays all the recipes
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do # This shows one specific recipe
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do # This shows a recipe to be edited
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do # This makes those edits
    # This is where we will make our edits
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  post '/recipes' do # This makes a recipe
    #this is where I'll make the new recipe
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end
