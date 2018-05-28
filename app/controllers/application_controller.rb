class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/' do
    erb :index
  end

  get '/recipes' do
      @recipes =  Recipe.all
      erb :index
  end

  get '/recipes/:id' do
      @recipe = Recipe.find(params[:id])
      erb :show
  end

  post '/recipes/:id/delete' do
     @recipe = Recipe.find(params[:id])
     @recipe.delete
  end

end
