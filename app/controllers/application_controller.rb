class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  # POST	'/posts'	create action	creates one blog post
  # Recipe App new page '/recipes/new' responds with a 200 status code
  # Recipe App new page '/recipes/new' contains a form to create the recipe
  # Recipe App creating a new recipe creates a new recipe and saves to the database
  # Recipe App creating a new recipe redirects to the recipe show page
  get '/recipes/new' do
    erb :new
  end
  # GET	'/posts'	index action	index page to display all posts
  # Recipe App Index page '/recipes' responds with a 200 status code
  # Recipe App Index page '/recipes' displays a list of recipes
  # Recipe App Index page '/recipes' contains links to each recipe's show page
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  # GET	'/posts/:id'	show action	displays one blog post based on ID in the url
  # Recipe App show page '/recipes/:id' responds with a 200 status code
  # Recipe App show page '/recipes/:id' displays the recipe's name
  # Recipe App show page '/recipes/:id' displays the recipe's ingredients
  # Recipe App show page '/recipes/:id' displays the recipe's cook time
  # Recipe App show page '/recipes/:id' contains a links to delete the recipe
  # Recipe App show page '/recipes/:id' deletes via a DELETE request
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # get '/' do
  #   redirect to "/recipes/new"
  # end
  # PATCH (Sinatra POST)	'/posts/:id/edit'	edit action	edits one blog post based on ID in the url
  # Recipe App edit page '/recipes/:id/edit' responds with a 200 status code
  # Recipe App edit page '/recipes/:id/edit' contains a form to edit the recipe
  # Recipe App edit page '/recipes/:id/edit' displays the recipe's ingredients before editing
  # Recipe App edit page '/recipes/:id/edit' submits via a patch request
  get '/recipes/:id/edit' do  #load edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end
  # Recipe App updating a recipe redirects to the recipe show page
  patch '/recipes/:id' do #edit action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end
  # DELETE (Sinatra POST)	'/posts/:id/delete'	delete action	deletes one blog post based on ID in the url
  # Recipe App deleting a recipe deletes a recipe
  delete  '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end
