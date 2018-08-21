class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all

    erb :index
  end

  post '/recipes' do
    @recipes = Recipe.create(params)
    redirect to '/recipes/#{@recipe.id}'
  end
end
