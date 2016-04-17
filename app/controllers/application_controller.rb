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
    erb:'recipes'
  end
  
  get '/recipes/new' do
    erb:'new'
  end
  
  post '/recipes' do
    atts={}
    atts[:name] = params["name"]
    atts[:ingredients] = params["ingredients"]
    atts[:cook_time] = params["cook_time"]
    @recipe = Recipe.create(atts)
    redirect "recipes/#{@recipe.id}"
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params["id"])
    erb:'recipe'
  end
  
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params["id"])
    @recipe.delete
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params["id"])    
    erb:'edit'
  end
  
  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params["id"])
    @recipe.name = params["name"]
    @recipe.ingredients = params["ingredients"]
    @recipe.cook_time = params["cook_time"]
    @recipe.save
    redirect "recipes/#{@recipe.id}"
  end
  
end