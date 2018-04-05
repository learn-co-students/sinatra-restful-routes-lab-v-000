class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/recipes/new' do #renders a new recipe form
   erb :new
  end
  
  get '/recipes' do #shows the homepage with all recipes
   @recipes = Recipe.all
   erb :index
  end
  
  get '/recipes/:id' do #renders the recipe id page
   @recipe = Recipe.find_by_id(params[:id])
   erb :show
  end
 
  get '/recipes/:id/edit' do #renders edit page
   @recipe = Recipe.find_by_id(params[:id])
   erb :edit
  end
  
  patch '/recipes/:id' do #Update Action
   @recipe = Recipe.find_by_id(params[:id])
   @recipe.name = params[:name]
   @recipe.ingredients = params[:ingredients]
   @recipe.cook_time = params[:cook_time]
   @recipe.save
   redirect to "/recipes/#{@recipe.id}"
  end
  
  post '/recipes' do #Create Action
   @recipe = Recipe.create(params)
   redirect to "/recipes/#{Recipe.last.id}"
  end
  
   delete '/recipes/:id/delete' do
   @recipe = Recipe.find_by_id(params[:id])
   @recipe.delete 
   redirect to '/recipes'
  end
  
end