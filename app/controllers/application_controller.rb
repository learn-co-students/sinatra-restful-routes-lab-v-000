class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  ######INDEX ACTION##########
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

#########NEW ACTION#############
  get '/recipes/new' do
    erb :new
  end

  post "/recipes" do
    @recipes = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipes.id}"
  end

#######SHOW ACTION#################
  get '/recipes/:id' do
    @recipes = Recipe.find_by_id(params[:id])
    erb :show
  end

########EDIT ACTION################
  get '/recipes/:id/edit' do
    @recipes = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipes = Recipe.find_by_id(params[:id])
    @recipes.name = params[:recipe_name]
    @recipes.ingredients = params[:ingredients_names]
    @recipes.cook_time = params[:cook_time]
    @recipes.save
    redirect "/recipes/#{@recipes.id}"
  end

########DELETE ACTION##############
  delete '/recipes/:id/delete' do
    @recipes = Recipe.find_by_id(params[:id])
    @recipes.delete
    redirect '/recipes'
  end
end
