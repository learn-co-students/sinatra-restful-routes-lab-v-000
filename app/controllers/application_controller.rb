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

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  delete '/posts/:id/delete' do #delete action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end



  # helpers do
  #   def all
  #
  #     @recipes.each do |recipe|
  #       "#{recipe.name} for more infomration /recipes/#{recipe.id}"
  #     end
  #   end
  # end
end
