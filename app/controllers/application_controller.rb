class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    redirect to '/recipes'
  end

  #POST ACTION
  get '/recipes' do #lists all recipes (index page)
    @recipes = Recipe.all
    erb :index
  end

  #NEW/CREATE ACTION
  get '/recipes/new' do #form to submit new recipe
    erb :new
  end

  post '/recipes' do #create action: saves recipe to databse
    @recipe = Recipe.create(
      name: params[:name],
      ingredients: params[:ingredients],
      cook_time: params[:cook_time]
      )
    redirect "/recipes/#{@recipe.id}"
  end

  #SHOW ACTION
  get '/recipes/:id' do #displays single recipe
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  #EDIT ACTION
  get '/recipes/:id/edit' do #loads edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do #handles the edit form submission with patch request
    @recipe = Recipe.find_by_id(params[:id]) #first pulls recipe by id
    @recipe.name = params[:name]  #then we update attributes and save
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}" #redirects to show page
  end

  #DELETE ACTION
  delete '/recipes/:id/delete' do #finds recipe by ID in the url parameters and deletes it
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end #of class ApplicationController
