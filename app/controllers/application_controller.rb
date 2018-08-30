class ApplicationController < Sinatra::Base
   configure do
      set :public_folder, 'public'
      set :views, 'app/views'
   end
   # 1. create table recipes : name, ingredients, cook_time
   # 2. create recipe model
   # 3. make route to render a form to create new recipe
   # 4. make route to display a single recipe
   # 5. make route to render edit form
   # 6. make route to display all recipe, render index page
   # 7. add show page that allow delete recipe, redirect to home page

   get '/' do
      erb :index
   end

   get '/recipes' do
      @recipe = Recipe.all
      erb :recipes
   end


   get '/recipes/new' do
      # binding.pry
      erb :new
   end

   post '/recipes' do
      @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
      redirect "/recipes/#{@recipe.id}"
   end

   get "/recipes/:id" do
      @recipe = Recipe.find_by_id(params[:id].to_i)
      erb :show
   end

   get "/recipes/:id/edit" do
      @recipe = Recipe.find_by_id(params[:id].to_i)
      erb :edit
   end

   patch '/recipes/:id' do
      @recipe = Recipe.find_by_id(params[:id].to_i)
      @recipe.name = params[:name]
      @recipe.ingredients = params[:ingredients]
      @recipe.cook_time = params[:cook_time]
      @recipe.save
      erb :show
   end

   delete '/recipes/:id/delete' do
      @recipe = Recipe.find_by_id(params[:id].to_i)
      @a = @recipe.name
      @recipe.delete
      "Deleted #{@a}"
      redirect '/'
   end
end
