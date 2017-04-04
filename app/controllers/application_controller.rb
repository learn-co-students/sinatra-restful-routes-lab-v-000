class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do    #index page
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do        #self.create really only needs Class.create(params), but this helps remind what's in params for now.
    @recipe = Recipe.create(name: params["name"], ingredients: params["ingredients"], cook_time: params["cook_time"]) #(no need for .save with .create)!
    redirect to "/recipes/#{@recipe.id}" #double-quotes ONLY
  end

  get '/recipes/:id' do #an individual recipe
    @recipe = Recipe.find(params[:id]) #find recipe (supplied by /:id in url), create object and pass it off to show.erb
    erb :show
  end

  get '/recipes/:id/edit' do  #load edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  post '/recipes/:id' do #POST not PATCH.
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end


  post '/recipes/:id/delete' do #POST not DELETE. receives delete (post) request from show.erb form. finds and deletes object from db.
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end
