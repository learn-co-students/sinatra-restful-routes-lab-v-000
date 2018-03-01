class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes/new' do
  	erb :new
  end

  get '/recipes/:id' do
  	@recipe = Recipe.find(params[:id])
  	erb :show
	end

	delete '/recipes/:id/delete' do
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
		erb :delete
	end

	patch '/recipes/:id' do 
		@recipe = Recipe.find(params[:id])
		@recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
		
		erb :show
	end
	
	get '/recipes/:id/edit' do
		@recipe = Recipe.find(params[:id])
		erb :edit
	end

  post '/recipes' do 
  	@recipe = Recipe.create(params)
  	
  	redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes' do
  	@recipes = Recipe.all
  	erb :recipes
  end 

  

end