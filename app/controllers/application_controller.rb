require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do #renders form to submit new recipe
    erb :new
  end

  post '/recipes' do #pull values from params hash, which will be the values entered by user on form
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])

    redirect "/recipes/#{@recipe.id}" #go to the specific page for the recipe, as specified by its ID
  end

  get '/recipes' do #shows all recipes
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do #shows single recipe associated with the auto-generated ID from params hash
    @recipe = Recipe.find_by_id(params[:id])

    erb :show
  end

  get '/recipes/:id/edit' do #renders edit form
    @recipe = Recipe.find_by_id(params[:id]) #look for recipe by ID

    erb :edit
  end

  patch '/recipes/:id' do #updates recipe by assigning new params values from edit form to recipe's various attributes
    @recipe = Recipe.find_by_id(params[:id])

    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    #binding.pry
    @recipe.delete
    redirect '/recipes'
  end

end
