require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do #loads a new recipe form to fill in
    erb :new
  end

  get '/recipes' do #loads index page
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do #outputs specific recipe

    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  post '/recipes' do #creates a new receipe and saves it
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do #loads the edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do #updates a recipe
    binding.pry
    @recipe = Recipe.find_by_id(params[:id])


    redirect to "/recipes/#{@recipe.id}"

  end


  post '/recipes' do
    @recipe = Recipe.find_by_id(params[:id])
    redirect to "/recipes/show"
  end


end
