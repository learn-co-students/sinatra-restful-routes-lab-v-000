class RecipeController < ApplicationController

  get '/recipes' do 
    @recipes = Recipe.all
    erb :'recipes/index'
  end
  
  get '/recipes/new' do
    erb :'recipes/new'
  end

  post '/recipes' do 
    @recipe = Recipe.create({name: params["name"],ingredients: params["ingredients"], cook_time: params["cook_time"]})
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :'recipes/show'
  end

  post '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    redirect "/recipes/#{recipe.id}/edit"
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params["name"]
    @recipe.ingredients = params["ingredients"]
    @recipe.cook_time = params["cook_time"]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :'recipes/edit'
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id]).delete
    redirect '/recipes'
  end

end