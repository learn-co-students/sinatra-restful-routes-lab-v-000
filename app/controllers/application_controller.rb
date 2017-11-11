class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
		@recipes = Recipe.all
    erb :index
  end

	get '/recipes' do 
		@recipes = Recipe.all
		erb :index
	end

	get '/recipes/new' do 
		erb :new
	end

	get '/recipes/:id' do 
		@recipe = Recipe.find(params[:id])
		erb :show
	end

	post '/recipes' do 
		@recipe = Recipe.create(params)
		@recipe.save
		redirect 'recipes/' + "#{@recipe.id}" 
	end


	get '/recipes/:id/edit' do
		@recipe2 = Recipe.find(params[:id])
		erb :edit  	
	end

	patch '/recipes/:id' do
		@recipe = Recipe.find(params[:id])
		recipe.name = params[:name]
		recipe.ingredients = params[:ingredients]
		recipe.cook_time = params[:cook_time]
		recipe.save
	end

  delete '/recipes/:id/delete' do 
		recipe = Recipe.find(params[:id])
    recipe.delete
		erb :index
	end

end
