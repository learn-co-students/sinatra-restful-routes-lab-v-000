require "pry"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end

  get "/recipes" do
    @all_recipes = Recipe.all
    erb :index
  end

  get "/recipes/new" do
    erb :new
  end

  post "/recipes" do
    recipe_name = params[:name]
    ingredients = params[:ingredients]

    if recipe_name.empty? || ingredients.empty?
      redirect "/recipes/failure"
    else
      @recipe = Recipe.new(params)
      @recipe.save
      redirect "/recipes/#{@recipe.id}"
    end
  end

  get "/recipes/:id" do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch "/recipes/:id" do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name] #if !params[:name].empty?
    @recipe.ingredients = params[:ingredients] #if !params[:ingredients].empty?
    @recipe.cook_time = params[:cook_time] #if !params[:cook_time].empty?
    @recipe.save

    redirect "/recipes/#{@recipe.id}"
  end

  get "/recipes/failure" do
    erb :failure
  end

  delete "/recipes/:id/delete" do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect "/recipes"
  end




end
