class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    @recipes = Recipe.all
    erb :index
  end
  
  get '/recipes' do
    #show all recipes
    @recipes = Recipe.all
    erb :recipes
  end
  
  get '/recipes/new' do
    
  end
  
  post '/recipes' do

  end
  
end