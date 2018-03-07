require './config/environment'
#========================================================== 
class ApplicationController < Sinatra::Base 
#==========================config========================== 
  set :views, Proc.new { File.join(root, "../views/") }
#===========================HOME=========================== 
  get "/" do 
    erb :index
  end
#===========================NEW============================ 
  get "/recipes/new" do 
    erb :'/recipes/new'
  end
  
  post '/recipes' do 
    @recipe = Recipe.create(params)
    
    redirect "/recipes/#{@recipe.id}"
  end
#==========================INDEX=========================== 
  get "/recipes" do 
    @recipes = Recipe.all
    
    erb :'/recipes/index'
  end
#==========================SHOW============================ 
  get "/recipes/:id" do 
    @recipe = recipe(params)
    erb :'/recipes/show'
  end
#==========================EDIT============================ 
  get "/recipes/:id/edit" do 
    @recipe = recipe(params)
    erb :'/recipes/edit'
  end
#--------------------------------------------------update-# 
  patch '/recipes/:id' do #edit action
    @recipe = recipe(params)
    
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    
    redirect "/recipes/#{@recipe.id}"
  end
#=========================DELETE=========================== 
  delete "/recipes/:id/delete" do 
    @recipe = recipe(params)
    @recipe.delete
    
    redirect '/recipes'
  end
#========================HELPERS=========================== 
  helpers do
    def recipe(params)
      Recipe.find(params[:id])
    end
  end
#========================================================== 
end