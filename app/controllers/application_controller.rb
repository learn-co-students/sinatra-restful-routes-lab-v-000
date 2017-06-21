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
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save

    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end


  post '/recipes/:id/edit' do
    recipe = Recipe.find_by_id(params[:id])
    params.each do |key, value|
      if key == :id
      elsif recipe.has_attribute?(key)
        recipe.send("#{key}=", value)
      end
    end
    recipe.save
    redirect "/recipes/#{recipe.id}"

  end

  post '/recipes/:id/delete' do
    @delete_post = Recipe.find_by_id(params[:id])
    @delete_post.delete
    redirect "/recipes"
  end
end
