class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes/new' do
    erb :new_recipe
  end

  post '/recipes/new' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :list_recipes
  end

=begin
  post '/up_recipes' do
    @recipes = Recipe.all
    erb :list_recipes
  end
=end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show_recipe
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect '/recipes'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit_recipe
  end

  patch '/recipes/:id/edit' do
    recipe = Recipe.find(params[:id])
    recipe.name = params[:name]
    recipe.ingredients = params[:ingredients]
    recipe.cook_time = params[:cook_time]
    recipe.save
  end
end
