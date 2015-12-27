class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    recipe = Recipe.create(params[:recipe])
    redirect "/recipes/#{recipe.id}"
  end

  get '/recipes/:id' do
    erb :show
  end

  get '/recipes/:id/edit' do
    erb :edit
  end

  post '/recipes/:id' do
    Recipe.find(params[:id]).update(params[:recipe])
    redirect "/recipes/#{current_recipe.id}"
  end

  post '/recipes/:id/delete' do
    Recipe.find(params[:id]).delete
    redirect '/recipes'
  end

  helpers do
    def current_recipe
      Recipe.find(params[:id])
    end
  end

end
