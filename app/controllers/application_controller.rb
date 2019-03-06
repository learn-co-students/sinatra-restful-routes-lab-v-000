class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
  end
  
  get '/recipes' do
    @all_recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    # binding.pry
    @recipe = Recipe.find(params[:id])
    erb :show
  end
  
  get '/recipes/:id/delete' do
    
  end
  
  
  
end
