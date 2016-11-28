class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do 
    
    erb :recipes
  end

  post '/recipes' do 
    @recipe = Recipe.create(:recipe => params[:name], :ingredients => params[:ingredients])

    redirect to '/recipes/#{@recipe.id}'
  end

  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])

    erb :show
  end




end