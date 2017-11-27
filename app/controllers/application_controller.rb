class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  
  get '/recipes/new' do
  	erb :new
   end

   get '/recipes' do 
   	@recipes = Recipe.all
   	erb :index
   end 


   get '/recipes/:id' do
   	@recipe = Recipe.find_by_id(params[:id])
   	erb :show
   end 

   get '/recipes/:id/edit' do
   	@recipe = Recipe.find_by_id(params[:id])
   	erb :edit
   end 

   patch '/recipes/:id/' do
   	@recipe = Recipe.find_by_id(params[:id])
   	@recipe.name = params[:name]
   	@recipe.ingredients = params[:ingredients]
   	@recipe.cook_time = params[:cook_time]
   	@recipe.save
   	redirect to "/recipes/#{@recipe.id}"
   end 

    post '/recipes' do
     @recipe = Recipe.create(params)
   	#@recipe = Recipe.create(:name => params[:name], :ingredents => params[:ingredients], :cook_time => params[:cook_time])
   	#add :title => params[:title], etc 
   	 redirect to "/recipes/#{@recipe.id}"
   	# or redirect to "/recipes/#{@recipe.id}"
   end 

   delete '/recipes/:id/delete' do
   	@recipe = Recipe.find_by_id(params[:id])
   	@recipe.delete
   	redirect to '/recipes'
   end 

end 

