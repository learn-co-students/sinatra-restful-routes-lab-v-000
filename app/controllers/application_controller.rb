class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do #new recipe form
    erb :new
  end

  get '/recipes' do #shows all recipes
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do #shows one recipe
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do #edit form for recipe
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  post '/recipes/:id' do #edits the recipe
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  post '/recipes' do #creates new recipe
    #binding.pry
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end

  post '/recipes/:id/delete' do #deletes the recipe
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect '/recipes'
  end
end
