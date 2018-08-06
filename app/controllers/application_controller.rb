class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    disable :show_exceptions
  end

  get '/' do
    erb :welcome
  end

  # post '/recipes' do
  get '/recipes' do
    @recipes = Recipe.all
    # binding.pry
    erb :index
  end

  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    # binding.pry
    # [1] pry(#<ApplicationController>)> @recipe
    # => #<Recipe:0x00000001e55b18
    #  id: 3,
    #  name: "pumpkin pie",
    #  ingredients: "pumpkin, flour, butter, sugar",
    #  cook_time: "1 hour">
    # [2] pry(#<ApplicationController>)> params
    # => {"name"=>"pumpkin pie",
    #  "ingredients"=>"pumpkin, flour, butter, sugar",
    #  "cook_time"=>"1 hour"}
    # [3] pry(#<ApplicationController>)> @recipe.id
    # => 3

  redirect to "/recipes/#{@recipe.id}"
  end

  get "/recipes/new" do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do  #load edit form
      @recipe = recipe.find_by_id(params[:id])
      erb :edit
    end

  patch '/recipes/:id' do #edit action
    @recipe = recipe.find_by_id(params[:id])
    @recipe.name = params[:recipe_name]
    @recipe.content = params[:recipe_ingredients]
    @recipe.content = params[:recipe_cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do #delete action
    # @recipe = recipe.find_by_id(params[:id])
    @recipe = recipe.find_by_id(@cookie.id)
    binding.pry
    @recipe.delete
    redirect to '/recipes'
  end
end
