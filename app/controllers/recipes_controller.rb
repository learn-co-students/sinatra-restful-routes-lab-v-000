
class RecipesController < ApplicationController
  get '/recipes' do
    erb :"recipes/index"
  end

  get '/recipes/new' do
    erb :"recipes/new"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :"recipes/show"
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    redirect '/recipes'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :"recipes/edit"
  end

  post '/recipes' do
     @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
     redirect to "recipes/#{@recipe.id}"
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    erb :"recipes/#{@recipe.id}/show"
  end



end
