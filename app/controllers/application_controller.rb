require 'pry'

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
  end

  # set up a controller action that will render a form to create a new recipe
  get '/recipes/new' do
    erb :new
  end

  # create a controller action that uses RESTful routes to display a single recipe
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  # renders a form to edit a single recipe
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  # update the entry in the database with the changes, and then redirect to the recipe show page
  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  # create and save this new recipe to the database.
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    Recipe.find(params[:id]).delete
    redirect '/recipes'
  end
end
