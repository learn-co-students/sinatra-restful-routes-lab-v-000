class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  redirect to "/recipes"
  end

#<------INDEX ACTION - allows the view to access all the recipes in the database through the instance variable @recipes
  get '/recipes' do
    @recipes=Recipe.all
    erb :index
  end
# --------> end of INDEX ACTION

#<------ NEW ACTION -  GET request to load the form to create a new recipe.
# POST request creates a new recipe based on the params from the form and saves it to the database.
# Once the item is created, this action redirects to the show page.
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe=Recipe.create(name: params["name"],ingredients: params["ingredients"], cook_time: params["cook_time"])
    redirect to "/recipes/#{@recipe.id}"
  end
# --------> end of NEW ACTION


#<------ SHOW ACTION - Dynamic route
  get '/recipes/:id' do
    @recipe=Recipe.find_by_id(params[:id])
    erb :show
  end
# --------> end of SHOW ACTION

#<------ EDIT ACTION - Dynamic route
# GET request loads the edit form in the browser
# PATCH request finds recipre by the ID from the URL, then we update attributes and save. redirects to show page.
# REMEBER - extra code in form and add use Rack::MethodOverride in config.ru
  get '/recipes/:id/edit' do
    @recipe=Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe=Recipe.find_by_id(params[:id])
    @recipe.name=params[:name]
    @recipe.ingredients=params[:ingredients]
    @recipe.cook_time=params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end
# --------> end of EDIT ACTION

#<------ DELETE ACTION - Dynamic route
# delete button added to show page. Once clicked, we find the recipe by ID based on URL path and delete it.
# then we redirect to index page
  delete '/recipes/:id/delete' do
    @recipe=Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
# --------> end of DELETE ACTION
end
