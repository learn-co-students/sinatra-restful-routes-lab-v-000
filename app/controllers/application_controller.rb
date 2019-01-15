class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    @recipes = Recipe.all #define instance variable for view
    erb :index #show all recipes view (index)
  end


  get '/' do
    redirect '/recipes'
  end

    get '/recipes/new' do
      @recipe = Recipe.new
      erb :new
    end


    post '/recipes' do
      @recipe = Recipe.create(name: params['name'], ingredients: params['ingredients'], cook_time: params['cook_time'])
      redirect to "/recipes/#{ @recipe.id }"
    end


  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    Recipe.destroy(params[:id])
  end


end
