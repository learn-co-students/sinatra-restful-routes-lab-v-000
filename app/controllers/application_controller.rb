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
    
    redirect to "/recipes/#{@recipe.id}"
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    
    if @recipe
      erb :show
    else 
      redirect to "/error" # I added this part, for an edge case.
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
    recipe = Recipe.find_by_id(params[:id])
    
    recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    
    redirect to "/recipes/#{recipe.id}"
    # Interestingly, as I discovered in Shotgun, I mistakenly wrote @recipe.id above, yet the tests didn't catch it!
  end
  
  delete '/recipes/:id' do
    recipe = Recipe.find_by_id(params[:id])
    recipe.delete
    redirect to "/recipes"
  end

end
