class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    erb :index
  end

  delete '/recipes/:id/delete' do
  	@recipe = Recipe.find(params[:id])
  	@recipe.delete
  	redirect '/recipes'
  end

  get '/recipes/:id/edit' do
  	@recipe = Recipe.find(params[:id])
  	erb :edit
  end

  patch '/recipes/:id' do
  	@recipe = Recipe.find(params[:id])
  	@recipe.name = params[:name]
  	@recipe.ingredients = params[:ingredients]
  	@recipe.cook_time = params[:cook_time]
  	@recipe.save
  	redirect "/recipes/#{params[:id]}"
  end

  post '/recipes' do
  	@recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
  	if @recipe.save
  		redirect "/recipes/#{@recipe.id}"
  	else
  		redirect '/error'
  	end
  end

  get '/recipes/new' do
  	erb :new
	end

	get '/recipes/:id' do
  	@recipe = Recipe.find_by(id: params[:id])
    #NOTE: find_by returns nil if nothing is found, find raises error under the same scenario
  	if @recipe
  		erb :recipe
  	else
  		erb :error
  	end
  end
end