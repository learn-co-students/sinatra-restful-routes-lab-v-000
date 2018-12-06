class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get('/recipes/new'){
    erb :new
  }
  
  post('/recipes'){
   @rcp = Recipe.create(params)
   redirect to "/recipes/#{@rcp.id}"
  }

  get('/recipes/:id'){
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  }
  
    get('/recipes'){
    @recipes = Recipe.all
    erb :index
    }

  
  delete('/recipes/:id'){
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  }
  
  get('/recipes/:id/edit'){
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  }

  patch('/recipes/:id'){
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
}


end
