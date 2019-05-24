class ApplicationController < Sinatra::Base
  configure do
    
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/' do 
    erb :index
  end 
  
  get '/recipes' do 
    @recipes = Recipe.all
    erb :recipes
  end 
  
  get '/recipes/new' do 
    erb :new
  end 
  
  post '/recipes' do 
    @recipe = Recipe.new
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    if @recipe 
      redirect to "/recipes/#{@recipe.id}"
    end
  end 
  
  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show
  end 
  
  delete '/recipes/:id' do 
    @recipe = Recipe.delete(params[:id])
    
    redirect '/recipes'
  end 
  
  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    erb :edit  
  end 
  
  patch '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    if @recipe 
      erb :show
    else 
      redirect '/failiure'
    end
  end 

  get '/success' do 
    erb :success
  end 
  
  get '/failure' do 
    erb :failure
  end  
  
end
