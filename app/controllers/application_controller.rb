class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    # binding.pry
    @recipes = Recipe.all   
    erb :index
  end

  get '/recipes/:id' do
    # binding.pry
    @recipe = Recipe.find_by(:id => params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(:id => params[:id])
    erb :edit
  end

  delete '/recipes/:id' do
    
  end

  
end
