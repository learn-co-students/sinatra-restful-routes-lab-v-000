class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  
  get '/recipes/new' do
    erb :new 
  end
  
  post '/recipes' do
    @recipe = Recipe.create(params)
    # I think this works, but it's usually better to call #new and #save instead.
    binding.pry
    redirect to "/recipes/#{@recipe.id}"
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    
    if @recipe
      erb :show
    else 
      redirect '/error' # I added this part, for an edge case.
    end
  end
  
  get '/error' do
    erb :error
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end
  
  patch '/recipes/:id' do 
    #binding.pry
  end
  
  delete '/recipes/:id' do
    recipe = Recipe.find_by_id(params[:id])
    recipe.delete
    redirect to "/recipes"
  end

end
