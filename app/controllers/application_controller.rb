class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do #index page redirect
  	redirect "/recipes"
  end 

  get '/recipes' do #list all recipes
  	@recipes = Recipe.all
  	erb :index
  end 

  get '/recipes/new' do #new recipe form
    erb :new
  end 

  post '/recipes' do #makes new recipe object and stores in database
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end 

  get '/recipes/:id' do  #loads show page
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do #edits recipe
    @recipe = Recipe.find_by(id: params[:id])
    erb :edit
  end 

  patch '/recipes/:id' do  #updates a recipe
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do #delete recipe
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    erb :delete
    redirect "/recipes"
  end 

end