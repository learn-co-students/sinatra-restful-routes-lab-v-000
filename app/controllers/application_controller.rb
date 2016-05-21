require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do #new recipe form
    erb :new
  end

  get '/recipes' do #show all recipes
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do  #show :id recipe
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do #edit :id recipe
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  post '/recipes' do  #creates :id recipe and redirects to :show
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  post '/recipes/:id' do  #updates :id recipe    (POST not PATCH!)
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.update = params
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  post '/recipes/:id/delete' do #delete :id recipe (post!)
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    redirect to '/recipes'
  end
end