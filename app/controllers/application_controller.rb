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

  post '/recipes/new' do
    @recipe = Recipe.create(params)

    erb :show
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
  
    erb :show
  end

  get '/recipes' do
    erb :recipes
  end

end