
class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    erb :index
  end
  
  get '/recipes/new' do
    erb :new
  end
  
  post '/recipes' do
    # creates and saves a new recipe in the DB 
    
    redirect '/recipes/#{Recipe.last.id}'
  end
  
  get '/recipes/:id/edit' do 
    # find by id
    
    erb :edit
  end
  
  patch '/recipes' do 
    # find and update recipe 
    
    redirect '/recipes/#{@cookie.id}'
  end
  
  get '/recipes/:id' do
    # find by id
    
    erb :show
  end
  
  delete '/recipes/:id/delete'
    # delete recipe
    
    redirect '/recipes'
  end
  
end