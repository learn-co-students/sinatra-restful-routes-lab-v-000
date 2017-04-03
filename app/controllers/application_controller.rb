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
    @recipe = Recipe.find_by(id: params[:id])
    if !@recipe
      redirect '/'
    end
      erb :show
  end

  get '/recipes/:id/edit' do
    # including delete button?
    erb :edit
  end

  patch '/recipes/:id' do
    # modify instance of recipe and save then redirect to display
  end

  delete '/recipes/:id' do
    # delete the instance of the recipe
  end

end
