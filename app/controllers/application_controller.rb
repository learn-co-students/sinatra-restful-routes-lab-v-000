class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  
  end
  #index
  get '/recipes' do
    @all_recipes = Recipe.all
    erb :index
  end
  #new
  get '/recipes/new' do
    erb :new_recipe
  end
  #create
  post '/recipes' do
    @recipe = Recipe.create(params)
    
    redirect to "/recipes/#{Recipe.last.id}"
  end
  #show
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show_recipe
  end
  #edit
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end
  #update
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])

    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[cook_time]

    @recipe.save

    redirect to "/recipes/#{@recipe.id}"
  end
  #delete
  delete '/recipes/:id' do
    Recipe.destroy(params[:id])
  end

end
