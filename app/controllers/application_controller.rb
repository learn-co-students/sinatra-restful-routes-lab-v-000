require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end


  get '/recipes/new' do
    bindng.pry
    erb :new
  end


  get 'recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end






  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end






end
