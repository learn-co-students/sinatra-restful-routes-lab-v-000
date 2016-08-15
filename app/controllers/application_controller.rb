require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Main page loads and redirects to recipes route.

  get '/' do
    redirect '/recipes'
  end

  # Index page at main recipes route shows all recipes
  # and gives choice to create new recipe or edit current card.

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # Create new recipe with form.

  get '/recipes/new' do
    erb :new
  end

  # Loads the show page

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  # Creates the recipe after receiving form input.

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  # Loads the edit form

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  # Updates recipe after creating from new or edit form.

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect '/recipes'
  end
end
