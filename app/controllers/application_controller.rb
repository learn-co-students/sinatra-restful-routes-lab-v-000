class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

##Show ALL
  get '/recipes' do
    @recipes = Recipe.all
    erb :recipes
  end


##New link was clicked, brings to NEW form
  get '/recipes/new' do
    erb :new
  end
##NEW form was filled out, adds instance to db with new info
  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    if !!@recipe
      @recipe.save
      redirect to "/recipes/#{@recipe.id}"
    else
      erb :error
    end
  end


##Show particular recipe
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end


##Edit link was clicked, brings to EDIT form
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end
##EDIT form was filled out, updates instance with new info to db
  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end


##DELETE link was clicked, deletes instance from db
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    if !!@recipe
      @recipe.destroy
      erb :delete
    else
      erb :error
    end
  end

end
