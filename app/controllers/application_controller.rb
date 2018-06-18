require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get "/recipes/new" do
    erb :new
  end

  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  post "/recipes" do
  # create and save in database
    recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    if recipe.save
      # show page for the recipe
      redirect "/recipes/#{recipe.id}"
    end

  end

  get "/recipes/:id" do
    # binding.pry
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  delete "/recipes/:id" do
      @recipe = Recipe.find_by_id(params[:id])
      @recipe.delete
  end

  post "/recipes/:id/edit" do
  end


end
