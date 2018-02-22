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
    erb :show
  end



end
