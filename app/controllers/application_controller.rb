class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end
  get '/recipes' do  #allows the view to access all the recipes in the database through the instance variable @recipes
    @recipes = Recipe.all
     erb :index
  end
  get '/recipes/new' do  #load the form to create a new recipe
     erb :new
  end

   post '/recipes' do #create action and creates new recipe based on the params from the form and saves it to the databae, redirects to the show page
     @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do  #displays a single post
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

   delete '/recipes/:id/delete' do  #delete action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect '/recipes'
  end

  get '/recipes/:id/edit' do #load edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do #edit action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
  @recipe.save
  redirect "/recipes/#{@recipe.id}"
end


 end
