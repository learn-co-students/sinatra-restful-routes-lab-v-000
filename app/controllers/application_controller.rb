class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    if params[:id] == "new"
      erb :new
    else
      @recipe = Recipe.find(params[:id])
      erb :show
    end
  end

  delete '/recipes/:id/delete' do 
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect '/recipes'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "recipes/#{@recipe.id}"
  end
end



    




#   describe "updating a recipe" do
#     before do
#       @cookie = Recipe.create(
#         name:   "Chocolate Chip Cookies", 
#         ingredients:  "chocolate chips, flour, sugar, butter", 
#         cook_time:  "30 minutes", 
#       )
#       visit "/recipes/#{@cookie.id}/edit"
#       fill_in "name", :with => "Double chocolate chip cookies"
#       fill_in "ingredients", :with => "chocolate chips, flour, sugar, butter, cocoa powder"
#       fill_in "cook_time", :with => "30 minutes"
#       click_button "submit"
#     end

#     it "redirects to the recipe show page" do
#       expect(page.current_path).to eq("/recipes/#{@cookie.id}")
#       expect(page).to have_content("Double chocolate chip cookies")
#       expect(page).to have_content("chocolate chips, flour, sugar, butter, cocoa powder")
#       expect(page).to have_content("30 minutes")
#     end
#   end

