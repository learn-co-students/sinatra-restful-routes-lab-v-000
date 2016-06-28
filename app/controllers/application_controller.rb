class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :all
  end

  post '/recipes' do
    new_recipe = Recipe.new(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    new_recipe.save    
    redirect "/recipes/#{new_recipe.id}"
  end  

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :single
  end

  patch '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]  
    @recipe.ingredients = params[:ingredients]  
    @recipe.cook_time = params[:cook_time]
    @recipe.save  
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(:id => params[:id])
    erb :edit
  end

  delete '/recipes/:id/delete' do
    Recipe.delete(params[:id])
    redirect '/recipes'
  end

end