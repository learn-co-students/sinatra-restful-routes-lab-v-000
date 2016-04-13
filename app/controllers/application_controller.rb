class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/' do
  	redirect to '/recipes'
  end

#index page to display all recipes
  get '/recipes' do
  	@recipes = Recipe.all 
  	erb :index
  end
  
#render form for new recipe
  get '/recipes/new' do  
  	erb :new
  end

#create and save  new recipe
  post '/recipes' do
  	@recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], 
  		:cook_time => params[:cook_time])
  	redirect "/recipes/#{@recipe.id}"
  end

#show one single recipe based on id
  get '/recipes/:id' do 
  	@recipe = Recipe.find_by_id(params[:id])
  	erb :show 
  end

#get edit form
  get '/recipes/:id/edit' do  
  	@recipe = Recipe.find_by_id(params[:id])
  	erb :edit
  end

#edit one recipe
  post '/recipes/:id' do
  	@recipe = Recipe.find_by_id(params[:id])
  	@recipe.name = params[:name]
  	@recipe.ingredients = params[:ingredients]
  	@recipe.cook_time = params[:cook_time]
  	@recipe.save
  	redirect to "/recipes/#{@recipe.id}"
  end

#delete one recipe
  post '/recipes/:id/delete' do
  	@recipe = Recipe.find_by_id(params[:id])
  	@recipe.delete
  	redirect to '/recipes'
  end

 end