class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    erb :index
  end
  
  get '/recipes/:id' do
    # find by id
    
    erb :show
  end
  
  get '/recipes/:id/edit' do 
    # find by id
    
    erb :edit
  end
  
end