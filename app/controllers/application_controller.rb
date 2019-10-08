class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    # redirect to homepage/index
    redirect to '/recipes'
  end

  get '/recipes' do # index action allowing view to access all recipes thru instance variable @recipes
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do # loads form to create new recipe
    erb :new
  end

  post '/recipes' do # create action creating and saving new recipe based on params from form, then redirects to show page
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do # show action to display a single recipe. dynamic url allows ID to be called in the view thru params hash
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do #load edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do #edit action. edit form submission. redirect to show page.
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save

    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do #delete action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete

    redirect to '/recipes'
  end
end
