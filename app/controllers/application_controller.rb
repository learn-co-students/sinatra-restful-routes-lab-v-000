class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    redirect "/recipes"  
  end
  
  # New action -
  get '/recipes/new' do
    
    erb :new
  end
  
  post '/recipes' do
    @recipe = Recipe.create(params)
    
    redirect to "/recipes/#{@recipe.id}"
  end
  
  # Show action -
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    
    erb :show
  end
  
  # Index action - 
  get '/recipes' do
  @recipes = Recipe.all
  
  erb :index
  end
  
  # Edit action -
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    
    erb :edit
  end
  
  # Patch action -
  
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params)
    
    redirect to "/recipes/#{@recipe.id}"
  end
  
  # Delete action -
  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    
    redirect to '/recipes'
  end
  
end
