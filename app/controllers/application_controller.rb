class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do #new recipe form
    erb :new
  end

  get '/recipes' do #show all recipes
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do  #show :id recipe
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do #edit :id recipe
  end

  patch '/recipes/:id' do #saves edit of :id
  end

  post '/recipes' do #create new recipe from /recipes/new form
  end

  delete '/recipes/:id/delete' do #deletes :id recipe
  end
end