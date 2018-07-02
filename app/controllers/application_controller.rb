class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    erb :index
  end

  get '/recipes' do 
    erb :recipes 
  end
  
  get '/recipes/new' do
    erb :new 
  end
  
  post '/recipes' do
    Recipe.create(params)
    redirect '/recipes/#{recipe.id}'
  end
  
  get '/recipes/:id' do
    erb :show
  end

end