class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Index Page
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # # Create Page
  # get '/recipes/new' do
  #   erb :new
  # end
  #
  # # Create Object Action
  # post '/recipes' do
  #   recipe = Recipe.create(params)
  #   redirect to "/recipes/#{recipe.id}"
  # end
  #
  # # Show Page
  # get '/recipes/:id' do
  #   @recipe = Recipe.find(params[:id])
  #   erb :show
  # end




end
