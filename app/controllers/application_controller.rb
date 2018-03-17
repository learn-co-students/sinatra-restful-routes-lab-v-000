class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #index page to display all recipes
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #displays create recipe form
  get '/recipes/new' do
    erb :new
  end

  #creates one recipe
  post '/recipes' do
    if @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
      redirect to "/recipes/#{@recipe.id}"
    else
      redirect to "/recipes/new"
    end
  end

  #displays one recipe based on ID in the url
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  #displays edit form based on ID in the url
  get	'/recipes/:id/edit'	do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  #edits an existing recipe based on ID in the url
  patch	'/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  #deletes one recipe based on ID in the url
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
end
