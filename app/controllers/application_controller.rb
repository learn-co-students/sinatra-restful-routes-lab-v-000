class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
   
  get '/recipes/new' do 
    #binding.pry
    
    erb :new 
  end 
  
 # get '/' do
  #  @recipes = Recipe.all
   # erb :recipes 
  #end
  
  get '/recipes' do
    @recipes = Recipe.all 
    erb :recipes 
  end 
  
  get '/recipes/:id' do 
    #binding.pry
    recipe_id = params["id"]
    @recipe = Recipe.find(recipe_id) #test
    erb :show 
  end 
  
  get '/recipes/:id/edit' do 
    #binding.pry
    recipe_id = params["id"]
    @recipe = Recipe.find(recipe_id)
    
    erb :edit 
    #binding.pry
  end 
  
  patch '/recipes/:id' do  
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end
  
  post '/recipes' do 
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    #binding.pry
    redirect to "/recipes/#{@recipe.id}"  #{Recipe.last.id} 
  end 
  
  delete '/recipes/:id/delete' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end 
end