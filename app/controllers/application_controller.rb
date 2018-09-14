class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  post 'recipes/new' do
    recipe = Recipe.create(params)
    if recipe
      redirect 'recipes/#{recipe.id}'
    else
      redirect '/'
    end
  end

  get 'recipes/:id' do
    @recipe = Recipe.find_by(params)
    if recipe
      erb :show
    else
      redirect '/'
    end
  end

  get 'recipes/:id/edit' do
    erb :edit
  end

  patch 'recipes/:id' do
    recipe = Recipe.find_by(params)
    recipe.update(params[:name])
    recipe.update(params[:ingredients])
    recipe.update(params[:cook_time])
    redirect 'recipes/#{recipe.id}'
  end

  delete 'recipes/:id/delete' do
    Recipe.find_by(params).destroy
    redirect '/'
  end
end
