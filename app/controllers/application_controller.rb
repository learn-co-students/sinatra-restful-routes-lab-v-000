class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do #loads a new form
    erb :new
  end 

  post '/recipes' do #creates a new recipe
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do #loads show page
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  delete '/recipes/:id' do #deletes a recipe
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

  get '/recipes/:id/edit' do #loads edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do #edit action
    @recipe = Recipe.find_by_id(params[:id])    
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes' do
    @recipes = Recipe.all 
    erb :index
  end
end
