class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/recipes" do
    erb :index
  end

  get "/recipes/new" do
    erb :new
  end

  post "/recipes" do
    Recipe.create(name: params[:name], cook_time: params[:cook_time], ingredients: params[:ingredients])
    redirect to "/recipes/#{last_created_recipe.id}"
  end

  get "/recipes/:id" do
    erb :show
  end

  get "/recipes/:id/edit" do
    erb :edit
  end

  patch "/recipes/:id" do
    current_recipe.update(name: params[:name], cook_time: params[:cook_time], ingredients: params[:ingredients])
    redirect to "/recipes/#{current_recipe.id}"
  end

  delete "/recipes/:id" do
    current_recipe.delete
  end

  helpers do
    def all_recipes
      Recipe.all
    end

    def current_recipe
      Recipe.find_by_id(params[:id])
    end

    def last_created_recipe
      Recipe.last
    end
  end
end
