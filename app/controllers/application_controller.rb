class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/recipes/new' do
    erb :newrecipe
  end

  post '/recipes' do
    recipe = Recipe.new(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    @recipes = Recipe.all
    @id = recipe.id

   if recipe.save
     redirect "/recipes"
    else
      redirect "/error"
    end
  end

  get '/recipes' do
    @recipe = Recipe.all
    erb :show
  end


  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  #update
  patch "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{ @recipe.id }"
  end



  get "/error" do
    erb :error
  end


end
