require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
     erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  post '/recipes/:id' do

  end

  patch '/recipes/:id/edit' do
    recipe = Recipe.find(params[:id])
    # recipe.name = params[:name]
    # recipe.ingredients = params[:ingredients]
    # recipe.cook_time = params[:cook_time]
    binding.pry

    params.each do |key,value|
      recipe.send("{params[key]}=",value)
    end
    recipe.save
    redirect "/recipe/#{recipe.id}"
  end

  delete '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.delete
    redirect '/recipes'
  end




end  #  End of Class