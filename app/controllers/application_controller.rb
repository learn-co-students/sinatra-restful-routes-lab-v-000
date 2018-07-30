class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do  #loads index page
    redirect to "/recipes"
  end

  get "/recipes" do  #loads index page
    @recipes = Recipe.all
    erb :index
  end

  get "/recipes/new" do  #loads new form
    erb :new
  end

  post "/recipes" do  #creates a recipe
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  get "/recipes/:id" do  #loads show page
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do  #loads edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

# need to add 'use Rack::MethodOverride' to config.ru
# so app will know how to handle patch and delete requests

  patch "/recipes/:id" do  #updates a recipe
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  delete "/recipes/:id/delete" do  #deletes a recipe
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to "/recipes"
  end

end
