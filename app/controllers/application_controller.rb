class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    erb :create
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to '/recipes/#{@recipe.id}'
  end

end
