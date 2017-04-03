class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    # create instance of recipe and save, then redirect to display
  end

  get '/recipes/:id' do
    if !current_recipe
      redirect '/'
    end
      erb :show
  end

  get '/recipes/:id/edit' do
    erb :edit
  end

  patch '/recipes/:id' do
    recipe = current_recipe
    recipe.name = params[:name]
    recipe.ingredients = params[:ingredients]
    recipe.cook_time = params[:cook_time]
    recipe.save
    erb :show
  end

  delete '/recipes/:id' do
    # delete the instance of the recipe
  end

  helpers do
      def current_recipe
        Recipe.find_by(id: params[:id])
      end
  end

end
