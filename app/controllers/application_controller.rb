class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  get '/recipes/new' do #contains form to create recipe
    erb :new
  end

  get '/recipes' do #loads index page with all recipes
    @recipes = Recipe.all
    erb :index
  end
end
