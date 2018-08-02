class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    # displays create recipe form
    erb :new
  end

  get '/recipes' do
    # index page to display all recipes
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    # displays one recipe based on id in url
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    # displays edits based on id in url
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    # modifies based on id in url
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  post '/recipes' do
    # replaces base on id in url
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    # deletes one recipe based on id in url
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    redirect to '/recipes'
  end

end
