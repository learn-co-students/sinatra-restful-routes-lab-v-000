class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @all_recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do # route is a GET request to localhost:9393/recipes/new, where user will see a form to create a new recipe
    erb :new # render the new.erb view file, which contains code for the form to create a new recipe
  end

  post '/recipes' do # CREATE ACTION - route is POST request to localhost:9393/recipes; receive the POST request sent by the form to create a new recipe
    @recipe = Recipe.create(params) # instantiate @recipe instance with its @name, @ingredients and @cook_time attributes set through mass assignment and save instance to DB
    # @name, @ingredients and @cook_time attribute values = what user submitted in the name, ingredients and cook_time form fields, respectively
    redirect to "/recipes/#{@recipe.id}" # browser navigates to localhost:9393/recipes/the @id attribute value of @recipe instance just created
  end

  get '/recipes/:id' do # route is a GET request to localhost:9393/recipes/what user enters for :id route variable
    @recipe = Recipe.find_by_id(params[:id])
    # params[:id] is what the user typed into the URL in place of :id route variable - we are finding the recipe instance whose @id attribute value = params[:id] and storing instance in @recipe to pass this data to view file
    erb :show # render the show.erb view file, which will display a single recipe
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

  get '/recipes/:id/edit' do # route is GET request to localhost:9393/ID entered by user/edit
    @recipe = Recipe.find_by_id(params[:id]) # find recipe instance to edit by its @id attribute value, which = what user entered in URL to replace :id route variable
    erb :edit # renders the edit.erb view file, which contains code for edit form to edit recipe
  end

  patch '/recipes/:id/edit' do # route is a PATCH request to localhost:9393/recipes/some ID entered by user/edit. This route will receive the PATCH request sent by the edit form
    @recipe = Recipe.find_by_id(params[:id]) # find recipe instance by its @id attribute value, which = what user entered in URL to replace :id route variable
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save # Call #save on the @recipe instance to update the column values in its row representation in recipes table

    redirect to "/recipes/#{@recipe.id}"
    # The edit.erb view file is a form with fields for name, ingredients, and cook_time
    # When the user edits the values in name, ingredients and cook_time fields and submits form,
    # The data submitted = values corresponding to each respective :name, :ingredients, and :cook_time key in params hash
    # We must update the @recipe instance's attribute values = values in params hash
    # Redirect user to show page of recipe just edited '/recipes/the @id value of @recipe instance'
  end
end
