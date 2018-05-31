class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end


  get '/' do
    "Welcome to the recipe app! link shorcuts: /recipes, /recipes/new, recipes/(the id number of recipe)/edit"
  end

  get '/recipes' do
    # displays a list of recipes
    # contains links to each recipe's show page
    @recipes = Recipe.all
    # binding.pry
    erb :index
  end

  get '/recipes/new' do
    # contains a form to create the recipe
    # creates a new recipe and saves to the database
    # redirects to the recipe show page
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    # session[:id] = @recipe.id
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    # displays the recipe's name
    # displays the recipe's ingredients
    # displays the recipe's cook time
    # contains a links to delete the recipe
    # deletes via a DELETE request
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    # binding.pry
    erb :edit
  end

  patch '/recipes/:id/edit' do #edit action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do #delete action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    # session[:id].clear
    redirect to '/recipes'
  end

end