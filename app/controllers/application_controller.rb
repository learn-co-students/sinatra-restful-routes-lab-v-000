class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end
  get '/' do
    binding.pry
    erb :index
  end

  get '/new' do
    erb :new
  end

  get '/recipes' do
    #@recipes = Recipe.all
    erb :recipes
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save
    redirect to "recipes/#{recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(params[:id])
    erb :show
  end
end
