class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do   #index action - list all recipes
    @recipes = Recipe.all
    erb :"recipes/index"
  end

  get '/recipes' do  # new action
    @recipe = Recipe.create(:name=> params[:name], :ingredients=> params[:ingredients], :cook_time=> params[:cook_time])
    redirect to "/recipes/#{recipe.id}"
  end

  get '/recipe/:id' do  #show action
    @recipe = Recipes.find(params[:id])
    erb :"recipes/show"
    end


  get 'delete' do
    @recipe = Recipes.find_by_id(params[:id])
    @recipe.destory
    redirect to '/delete'
  end

end
