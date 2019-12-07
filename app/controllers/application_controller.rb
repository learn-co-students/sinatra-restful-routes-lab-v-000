class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all 
    erb :index
  end

  post '/recipes/:id/delete' do 
    recipe = Recipe.find_by(:id => params[:id])
    recipe.destroy
    redirect '/'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(:id => params[:id])
    erb :show
  end

end
