class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/recipes/new' do 
    erb :new   
  end 
  
  get '/recipes' do
    @recipes = Recipe.all 
    erb :index
  end
  
  get '/recipes/:id' do 
    @recipes = Recipe.find_by_id(params[:id])
    erb :show
  end 
  
  get '/recipes/:id/edit' do 
    @recipes = Recipe.find_by_id(params[:id])
    erb :edit 
  end 
  
  patch '/recipes/:id' do  #updates a recipe
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
  
  delete '/recipes/:id/delete' do 
    @recipes = Recipe.find_by_id(params[:id])
    @recipes.delete 
    redirect to '/recipes'
  end 
  
  
end