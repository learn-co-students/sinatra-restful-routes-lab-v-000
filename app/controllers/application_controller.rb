class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!


  get '/recipes/new' do
    erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do #show page for recipe
    find_recipe
    erb :show
  end

  get '/recipes/:id/edit' do
    find_recipe
    erb :edit
  end

  patch '/recipes/:id' do #edit action
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name],ingredients: params[:ingredients],cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do #delete action
    find_recipe
    @recipe.delete
    redirect to '/recipes/:id'
  end


  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

end
