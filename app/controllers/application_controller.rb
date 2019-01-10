class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/recipes' do 
    #displays all recipes (index)
    @recipes = Recipe.all 
    erb :index 
  end
  
  get '/recipes/new' do 
    #displays form to create new recipe 
    
    erb :new 
  end
  
  post '/recipes' do 
    #creates one new recipe 
    
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    
    redirect "/recipes/#{@recipe.id}"
    
  end
  
  get '/recipes/:id' do 
    #displays one new recipe 
    
    @recipe = Recipe.find_by_id(params[:id])
    
    erb :show 
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    
    erb :edit 
  end
  
  patch '/recipes/:id' do
    #modifies an existing recipe 
    
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    
    redirect "/recipes/#{@recipe.id}"
  end
  
  delete '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete 
    
    redirect '/recipes'
  end 
 
end
