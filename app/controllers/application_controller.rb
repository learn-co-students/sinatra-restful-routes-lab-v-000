class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do

  end
  get "/recipes" do


  @recipe22 = Recipe.create(:name => "waldorf salad1", :ingredients => "apples, cabbage, oil, vinegar", :cook_time => "0")
  @recipes = Recipe.all()
  
   erb :index
   end

end
