class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  ## route to submit a new recipe
  get '/recipes/new' do
  erb :new
  end
  
  ##new recipe form posts to this route, creates a new recipe, and redirects to the show page
  post '/recipes' do
  @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
  @recipe.save
  redirect "/recipes/#{@recipe.id}"
  end
  
  #show the information for one recipe based on the id
  get '/recipes/:id' do
  @recipe = Recipe.find_by_id(params[:id])
  erb :show
  end
  
  #display all the recipes 
  get '/recipes' do 
    @recipes = Recipe.all
    erb :recipes
  end 
  
  ## Below are the controller routes to update a recipes
  
  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end
 
patch '/recipes/:id' do 
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.name = params[:name]
  @recipe.ingredients = params[:ingredients]
  @recipe.cook_time = params[:cook_time]
  @recipe.save 
  redirect to "/recipes/#{@recipe.id}"
end
  

  ##Controller route to delete 
  
  delete '/recipes/:id' do #delete action
   @recipe = Recipe.find_by_id(params[:id])
   @recipe.delete
   redirect to '/recipes'
  end

  

end
