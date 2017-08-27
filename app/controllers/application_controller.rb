class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
#  get '/' do
#    erb :index
#  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])

     erb :show
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  delete '/recipes/:id/delete' do
   @recipes = Recipe.find(params[:id])
   @recipes.delete
 end

 get '/recipes/:id/edit' do
   @recipes = Recipe.find(params[:id])

   erb :edit
 end


 post '/recipes' do
   @recipes = Recipe.create(params)

  redirect to ('recipes/' + @recipes.id.to_s)
 end

 patch '/recipes/:id' do
  @recipes = Recipe.find(params[:id])
  @recipes.update(name: params[:name])
  @recipes.update(ingredients: params[:ingredients])
  @recipes.update(cook_time: params[:cook_time])

  redirect to ('/recipes/' + @recipes.id)
end

end
