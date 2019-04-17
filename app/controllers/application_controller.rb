require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here
  get '/recipes' do #loads list of all recipes with links
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do #loads new form
    erb :new
  end

  post '/recipes' do #create action
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

  get "/recipes/:id" do #load recipe
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do #load edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch "/recipes/:id" do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.update
    redirect to "/recipes/#{@recipe.id}"
  end

  delete "/recipes/:id" do
    @recipes = Recipe.all
    @recipes.select do |el|
      if el.id == params[:id].to_i
        Recipe.destroy(el.id)
      end
    end
    @recipes = Recipe.all
    redirect to "/recipes"
  end
end
