
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
    # creates and saves a new recipe in the DB 
    
    redirect '/recipes/#{Recipe.last.id}'
  end
  
  get '/recipes/:id' do
    # find by id
    
    erb :show
  end
  
  get '/recipes/:id/edit' do 
    # find by id
    
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