class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    redirect '/recipes'
  end
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  get '/recipes/new' do

    erb :new
  end
  post '/recipes' do
    #add
    @recipe = Recipe.create(params)
    redirect to ("/recipes/#{@recipe.id}")
  end

  get '/recipes/:id' do
    #get post by id
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    # @post = get post by params[:id]
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    #get the post by id then update
    @recipe = Recipes.find(params[:id])
    @recipe.update(name: params[:name])
    @recipe.update(ingredients: params[:ingredients])
    @recipe.update(cook_time: params[:cook_time])
    @recipe.save
    redirect to ("/recipes/#{@recipe.id}")
  end

  delete '/recipes/:id/delete' do
    #get the post by id then delete
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    erb :delete
  end
end
