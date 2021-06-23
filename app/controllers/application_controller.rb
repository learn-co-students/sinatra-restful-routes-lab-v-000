class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes/' do
    # binding.pry
    @recipes = Recipe.all   
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    # binding.pry
    @recipe = Recipe.find_by(:id => params[:id])
    erb :show
  end

  post '/recipes' do
    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{recipe.id}"
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params["id"])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params["id"])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    erb :show
  end

  delete '/recipes/:id' do
    @recipe = Recipe.delete(params["id"])
    redirect to "/recipes"
  end

end


