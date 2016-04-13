class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

	get '/recipes/new' do #renders form for new recipe
  	erb :new
  end

  get '/recipes' do #index page to display all recipes
  	@recipes = Recipe.all 
  	erb :index
  end
  
  get '/recipes/:id' do #show one single recipe based on id
  	@recipe = Recipe.find_by_id(params[:id])
  	erb :show 
  end

  get '/recipes/:id/edit' do  #loads edit form
  	@recipe = Recipe.find_by_id(params[:id])
  	erb :edit
  end

  patch '/recipes/:id' do #edit and update a recipe
  	@recipe = Recipe.find_by_id(params[:id])
  	@recipe.name = params[:name]
  	@recipe.ingredients = params[:ingredients]
  	@recipe.cook_time = params[:cook_time]
  	@recipe.save
  	redirect to "/recipes/#{@recipe.id}"
  end

  post '/recipes' do #create recipe
  	@recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], 
  		:cook_time => params[:cook_time])
  	redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do #delete recipe
  	@recipe = Recipe.find_by_id(params[:id])
  	@recipe.delete
  	redirect to '/recipes'
  end

 end