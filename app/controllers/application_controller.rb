class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/" do 
    redirect '/recipes'
  end 
  
  #list all recipes 
  get '/recipes' do
    @recipes = Recipe.all 
    
    erb :index
  end
  
  # create new recipe
  get '/recipes/new' do 
    erb :new 
  end 
  
  #display a recipe 
  get '/recipes/:id' do
    @recipe = selected_recipe
    
    erb:show
  end
  
  #post new recipe to db 
  post '/recipes' do 
    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    
    redirect "/recipes/#{recipe.id}"
  end 
  
  #edit a recipe 
  get '/recipes/:id/edit' do 
    @recipe = selected_recipe
    
    erb :edit 
  end 
  
  #patch edit to db 
  patch '/recipes/:id' do 
    @recipe = selected_recipe
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save 
    
    erb :show
  end
  
  #delete a recipe 
  delete '/recipes/:id/delete' do 
    @recipe = selected_recipe
    @recipe.delete
    
    redirect '/recipes'
  end
   
  helpers do 
    
    def selected_recipe
      Recipe.find(params[:id])
    end 
    
  end 
  
end