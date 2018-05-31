class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect "/recipes"
  end

  get '/recipes' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    erb :show
  end

  delete '/recipes/:id/delete' do
    current_recipe.delete
    redirect "/recipes"
  end

  get '/recipes/:id/edit' do
    erb :edit
  end

  patch '/recipes/:id/edit' do
    binding.pry
    current_recipe.update(params)
    redirect "/recipes/:id"
  end

  post "/recipes" do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  helpers do
    def current_recipe
      Recipe.find(params[:id])
    end
  end

end
