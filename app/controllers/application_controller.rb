class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get 'recipes/:id/edit' do

  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
    #displays single recipe based upon it's ID
    #displays name, incredients, cooktime
    #displays link to delete the recipe
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect '/recipes/#{@recipe.id}'

    #index page - displays list of recipes (as links)
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :recipes
  end


end
