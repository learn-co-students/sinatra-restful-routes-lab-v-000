class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    current_recipe(params)
    erb :show
  end

  get '/recipes/:id/edit' do
    current_recipe(params)
    erb :edit
  end


  helpers do
    def current_recipe(params)
      @recipe = Recipe.find_by_id(params[:id])
    end

  end

end
