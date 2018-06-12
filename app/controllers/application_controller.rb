class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/recipes' do
    # binding.pry
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
    # binding.pry
    # redirect "/recipes/#{@recipe.id}"
  end

  post '/recipes'  do
    # binding.pry
    x = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    # binding.pry
    # redirect '/recipes'
    # binding.pry
    redirect "/recipes/#{x.id}"

  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    # binding.pry
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do #edit action
    # binding.pry
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.name = params[:name]
  @recipe.ingredients = params[:ingredients]
  @recipe.cook_time = params[:cook_time]
  @recipe.save
  # binding.pry
  redirect to "/recipes/#{@recipe.id}"
end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end


end
