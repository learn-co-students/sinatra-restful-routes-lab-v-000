class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  # NEW action
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    recipe = Recipe.new
    recipe.name = params[:name]
    recipe.ingredients = params[:ingredients]
    recipe.cook_time = params[:cook_time]
    recipe.save

    redirect "/recipes/#{recipe.id}"
  end

  # INDEX action
  get '/recipes' do
    @recipes = Recipe.all

    erb :index
  end

  # SHOW action
  get '/recipes/:id' do
    # Recipe.find throws an exception on failure,
    # whereas find_by just returns nil
    @recipe = Recipe.find_by(id: params[:id])

    if @recipe
      erb:show
    else
      "RECIPE NOT FOUND"
    end
  end

  # DELETE action
  delete '/recipes/:id/delete' do
    recipe = Recipe.find_by(id: params[:id])

    recipe.destroy if recipe

    redirect '/recipes'
  end
end