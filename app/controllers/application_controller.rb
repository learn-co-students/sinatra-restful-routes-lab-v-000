class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :recipes
  end
  
  post '/recipes' do
    if ((@recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])) && @recipe.valid? )
      @recipe.save
      redirect "/recipes/#{@recipe.id}"
    else
      erb :recipes_new
    end
  end

  patch '/recipes/:id' do
    if (@recipe = Recipe.find_by(id: params[:id]))
      @recipe.name = params[:name]
      @recipe.ingredients = params[:ingredients]
      @recipe.cook_time = params[:cook_time]
      if @recipe.save
        redirect "recipes/#{@recipe.id}"
      else
        erb :recipes_edit
      end
    end
  end

  get '/recipes/new' do
    erb :recipes_new
  end

  get '/recipes/:id' do
    if (@recipe = Recipe.find_by(id: params[:id]))
      erb :recipe_show
    else
      redirect '/failure'
    end
  end

  get '/recipes/:id/edit' do
    if (@recipe = Recipe.find_by(id: params[:id]))
      erb :recipes_edit
    else
      redirect '/failure'
    end
  end

  get '/failure' do
    erb :failure
  end

  delete '/recipes/:id/delete' do
    if (@recipe = Recipe.find_by(id: params[:id])) 
      @recipe.delete
      redirect '/recipes'
    else
      redirect '/failure'
    end
  end
  
end