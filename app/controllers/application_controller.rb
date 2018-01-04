class ApplicationController < Sinatra::Base
  use Rack::MethodOverride
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  #the index action
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  get '/recipes/new' do
    erb :new
  end
  post '/recipes' do #retrieves a post request from the recipes/new form
#binding.pry
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"  #this will show a single recipe
  end
  get '/recipes/:id' do  #here we receive a get request to a dynamic route.   Where we create an instance variable (with @) given the params id that can be used within the erb file

  @recipe = Recipe.find_by_id(params[:id])

  erb :show
  end

  delete '/recipes/:id/delete' do #delete action from delete form

    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
    get '/recipes/:id/edit' do  #load edit form
      @recipe = Recipe.find_by_id(params[:id])
      erb :edit
#binding.pry
    end


  patch '/recipes/:id' do #edit action
#binding.pry
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"

  end

end


# =>    Again in the application_controller.rb, create a controller action that uses RESTful routes to display a single recipe.
# =>    Create a third controller action that uses RESTful routes and renders a form to edit a single recipe. This controller action should update the entry in the database with the changes, and then redirect to the recipe show page
# =>    Create a controller action (index action) that displays all the recipes in the database.
# =>    Add to the recipe show page a form that allows a user to delete a recipe. This form should submit to a controller action that deletes the entry from the database and redirects to the index page.
