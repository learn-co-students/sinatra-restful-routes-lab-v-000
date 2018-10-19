require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    redirect '/recipes/new'
  end
  
  get '/recipes/new' do #loads a new form
    erb :new
  end
  
  get '/recipes' do #loads a recipe page
      @recipes = Recipe.all
      erb :index
  end
  
  get '/recipes/:id' do #find recipes by id
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end
  
  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    # redirect to '/recipes/#{@recipe.id}'
    erb :show
  end
  
 post '/recipes' do  #creates a recipe
    @recipe = Recipe.create(params)
  # binding.pry
    redirect to "/recipes/#{@recipe.id}"

  end
  
  delete '/recipes/:id/delete' do
     @recipe = Recipe.find_by_id(params[:id])
     @recipe.delete
     
     redirect to '/recipes'
  end
    

end