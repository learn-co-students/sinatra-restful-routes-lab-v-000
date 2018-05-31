class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    redirect to '/recipes'
    # erb :index
  end

  # index action
  get '/recipes' do
    @recipes = Recipe.all
    # binding.pry
    erb :index
  end

  # new action
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])

    redirect "/recipes/#{@recipe.id}"
    # # placeholder is there until the real deal
    # erb :placeholder
  end

  # show action
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end


  # edit action
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  # update action
  get '/recipes/:id/update' do
    # @recipe = Recipe.find_by_id(params[:id])
    redirect "/recipes/#{params[:id]}/edit"
  end


  # delete action
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end
