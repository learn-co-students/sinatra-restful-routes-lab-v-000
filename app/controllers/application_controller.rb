class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do # controller action responds to a 'GET' request to the route '/'
    redirect to '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all # allows view to access all recipes in database through instance variable @recipes.

    erb :index
  end

  get '/recipes/new' do # controller action responds to 'GET' request loads the form to create a new recipe

    erb :new
  end

  post '/recipes' do #  controller action responds to 'create action' responds to  POST request, creates a new recipe (based on params from form) and saves it to database
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])

    redirect to "/recipes/#{@recipe.id}" # once item created, redirects to show page
  end

  get '/recipes/:id' do # displays a single recipe
    @recipe = Recipe.find_by_id(params[:id])

    erb :show
  end

  get '/recipes/:id/edit' do  #load edit form
    @recipe = Recipe.find_by_id(params[:id])

    erb :edit
  end

  patch '/recipes/:id' do #edit action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]

    @recipe.save

    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do #delete action
    @recipe = Recipe.find_by_id(params[:id]) # finds recipe in the database based on the ID in the url parameters, and deletes it.
    @recipe.delete
    redirect to '/recipes'
  end

end
