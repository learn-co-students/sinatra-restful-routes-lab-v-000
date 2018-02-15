require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
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

  #Create New Recipe
  post '/recipes' do
    recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    recipe.save
    redirect "/recipes/#{recipe.id}"
  end
  
  post '/recipes/:id/delete' do
    Recipe.find(params[:id]).destroy
    redirect '/recipes'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  post '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  
  get '/populate' do
    populate
    redirect '/recipes'
  end

  helpers do

    def populate
      Recipe.new(name: "lasagna", ingredients: "tomatoes, sauce", cook_time: 20).save
      Recipe.new(name: "pie", ingredients: "apples, sauce", cook_time: 20).save
      Recipe.new(name: "burger", ingredients: "ham, sauce", cook_time: 20).save
      Recipe.new(name: "pizza", ingredients: "dough, sauce", cook_time: 20).save
      Recipe.new(name: "juice", ingredients: "water, fruit", cook_time: 20).save
      Recipe.new(name: "pasta", ingredients: "noodlesdonough, sauce", cook_time: 20).save
      Recipe.new(name: "soup", ingredients: "broth, sauce", cook_time: 20).save
    end

  end

end