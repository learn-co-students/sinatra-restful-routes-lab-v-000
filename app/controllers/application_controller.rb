class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do # loads new form
    erb :new
  end

  get '/recipes' do # loads index page
    @recipes = Recipe.all
    erb :recipes
  end

  post '/recipes' do # creates a recipe
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

    # redirect to '/recipes/' + @recipe.id.to_s
    # below only works when 'use Rack::MethodOverride' is in config.ru
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do # loads show page
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  delete '/recipes/:id/delete' do # delete action
    @recipe = Recipe.find_by_id(params[:id]).destroy
    erb :deleted
  end

  get '/recipes/:id/edit' do # loads edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do # updates a recipe
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    erb :show
  end

end