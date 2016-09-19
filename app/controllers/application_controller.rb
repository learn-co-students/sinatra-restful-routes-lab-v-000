require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do #show index page
  	@recipes = Recipe.all
  	erb :index
  end

  get '/recipes/new' do # form to create new recipe
  	erb :new
 	end

  get '/recipes/:id' do # patch and delete requests
  	@recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do # form to edit
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do # update a recipe
  	@recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  post '/recipes' do # create a new recipe
  	@recipe = Recipe.create(params)
  	redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do # delete recipe
	  @recipe = Recipe.find_by_id(params[:id])
	  @recipe.delete
	  redirect to '/recipes'
	end

end