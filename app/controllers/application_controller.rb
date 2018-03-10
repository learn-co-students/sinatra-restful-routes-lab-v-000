class ApplicationController < Sinatra::Base
  #==================== CONFIGURATION =====================
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  #--------------------------------------------------------
  
  
  #================= INDEX / SHOW / NEW ===================
  get '/' do
    @recipes = Recipe.all
    erb :index
  end
  
  get '/recipes' do
    @recipes = Recipe.all
    erb :'index'
  end
  
  get '/recipes/new' do
    erb :'recipes/new'
  end
  #--------------------------------------------------------
  

  #============== CREATE / EDIT / UPDATE ==================
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'recipes/show'
  end
  
  post '/recipes' do
    @recipe = Recipe.new(params)
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'recipes/edit'
  end
  
  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end
  #--------------------------------------------------------

  
  #==================== DESTROY ===========================
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
  #--------------------------------------------------------
  
end