require './config/environment'

class ApplicationController < Sinatra::Base
  # register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  get '/recipes/new' do #loads new form
    erb :new
  end

  get '/recipes' do #loads index page
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do  #loads show page
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do #loads edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  post '/recipes/:id' do  #updates a recipe
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  post '/recipes' do  #creates a recipe
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  post '/recipes/:id/delete' do #delete action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
end