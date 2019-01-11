class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes/new' do
    erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all

    erb :index
  end

end
