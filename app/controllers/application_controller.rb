class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/recipes' do
    @recipe = Recipe.find_by(params[:name], params[:ingredients], params[:cook_time])
    "{@recipe1.id}"
    erb :index
  end
  get '/recipes/:id' do
    @recipe = Recipe.find_by(params[:name], params[:ingredients], params[:cook_time])
    erb :show

  end

  get '/recipes/:id/edit' do
     @recipe = Recipe.find_by(params[:name], params[:ingredients], params[:cook_time])

    erb :edit
  end

  get '/recipes/new' do
    @recipe = Recipe.new(params[:name], params[:ingredients], params[:cook_time])
   # @recipe.save

    erb :new

    redirect "/recipes"

  end

  post '/show' do
     # @recipe = Recipe.new(:nam => recipe_name, :ingredients => recipe_ingredients, :cook_time => recipe_cook_time)
  end
end