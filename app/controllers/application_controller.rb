class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  
  post '/recipes' do
    @recipe = Recipe.create(:name => params["name"], :ingredients => params["ingredients"], :cook_time => params["cook_time"])
    redirect to "/recipes/#{@recipe.id}"
  end
  
  get '/recipes/new' do
    erb :create_recipe
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show_recipe
  end
  
  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit_recipe
  end
  
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end
  
end
