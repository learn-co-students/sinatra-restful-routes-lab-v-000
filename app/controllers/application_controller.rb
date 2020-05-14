class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

    get '/recipes'
      @recipes = Recipe.all
      erb :index
    end

    get '/recipes/new'
      erb :new
    end

    post '/recipes' do
      @recipe = Recipe.create(name:params[:name], ingredients:params[:ingredients], cook_time:params[:cook_times])
      redirect to "/recipes/#{ @recipes.id }"
    end

    get '/recipes/:id' do
      @recipe = Recipe.find_by(id:params[:id])
      erb :show
    end

    get '/recipes/:id/edit' do
      @recipe = Recipe.find_by(id:params[:id])
      erb :edit
    end

    patch '/recipes/:id' do
      @recipe = Recipe.find_by(id:params[:id])
      @recipe.name = params[:name]
      @recipe.ingredients = params[:ingredients]
      @recipe.cook_time = params[:cook_time]
      @recipe.save 
        redirect to "/recipes/#{ @recipes.id }"
    end

    delete '/recipes/:id/delete' do
      @recipe = Recipe.find_by(id:params[:id])
      @recipe.delete
      redirect to :index
    end
  # code actions here!

end
