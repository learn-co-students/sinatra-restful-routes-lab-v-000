class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #index action
  get '/recipes' do
    @recipes = Recipe.all

    erb :index
  end
  #create action
  get "/recipes/new" do
    erb :new
  end
  post "/recipes" do
    Recipe.create(params)

    redirect to ("/recipes/#{Recipe.last.id}")
  end
  #show/delete action
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])

    erb :show
  end
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect to ("/recipes")
  end
  #edit action
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])

    erb :edit
  end
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

    redirect to ("/recipes/#{params[:id]}")
  end
end
