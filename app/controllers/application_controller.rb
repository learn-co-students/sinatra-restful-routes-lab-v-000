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

  get '/recipes/new' do
    erb :new
  end

  # post '/recipes/new' do
  #   @recipe = Recipe.new(params)
  #   redirect :show
  # end

  post '/recipes/post' do
    @recipe = Recipe.new(params)
    @recipe.save
    redirect '/recipes'
  end


  get "/recipes/:id" do

    @recipe = Recipe.find(params[:id])
    erb :show
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect 'recipes/#{@recipe.id}'
  end

  get "/recipes/:id/edit" do
    # binding.pry
    @recipe = Recipe.find(params[:id])
    erb :edit
  end
end
