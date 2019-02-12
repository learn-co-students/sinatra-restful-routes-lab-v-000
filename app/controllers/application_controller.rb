class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/recipes/new' do
    erb :new
  end

  
 ## -> create action // create a new recipe.

 get '/recipes' do
   @recipes = Recipe.all
   erb :index
 end

 post '/recipes' do
  @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
  redirect to "/recipes/#{@recipe.id}"
end

 ## -> show action // RESTful routes to display a single recipe.

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  # -> delete that shit
  # -> redirect to the index page.
 ## -> edit action // edit a single recipe - use update

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


    # redirect to the recipe show page

 ## -> index action

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  delete '/recipes/:id' do #delete action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end


end
