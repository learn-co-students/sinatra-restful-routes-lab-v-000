class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
  end
  
  get '/recipes' do
    # @recipe = Recipe.create(:name =>params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    @all_recipes = Recipe.all
    binding.pry
    erb :index
  end

end


# #<Recipe:0x00000002bb4fe8
#   id: 2,
#   name: "waldorf salad",
#   ingredients: "apples, cabbage, oil, vinegar",
#   cook_time: 0>,