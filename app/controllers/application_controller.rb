
class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @all = Recipe.all
    
    erb :index
  end
  
  get '/recipes/new' do
    erb :new
  end
  
  post '/recipes' do
    @recipe = Recipe.create(params)
    
    redirect '/recipes/#{Recipe.last.id}'
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    
    erb :show
  end
  
  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by(id: params[:id])
    
    erb :edit
  end
  
  patch '/recipes/:id' do 
    # find and update recipe 
    
    redirect '/recipes/#{@recipe.id}'
  end

  put '/recipes/:id' do
    # find and replace recipe, may not need this one
    
    redirect '/recipes/#{@recipe.id}'
  end
  
  delete '/recipes/:id/delete' do
    # delete recipe
    
    redirect '/recipes'
  end
  
end