require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  # ******** CRUD *********

  # Index
  get '/recipes' do
    @recipes = Recipe.all
    if @recipes.count < 1
      erb '<h2>No recipes found, click <a href="/recipes/new">here</a> to add a new recipe</h2>'
    else
      erb :index
    end
  end


  # Create ****************
  get '/recipes/new' do
    erb :new_recipe
  end

  post '/recipes' do
    @recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end


  # Read *******************
  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :recipe
  end


  # Update *****************
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :edit_recipe
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params [:cook_time]
    @recipe.save

    redirect to "/recipes/#{@recipe.id}"
  end


  # Delete *****************
  delete '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end
