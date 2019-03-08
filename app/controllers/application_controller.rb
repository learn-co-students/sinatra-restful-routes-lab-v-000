class ApplicationController < Sinatra::Base
    configure do
    	set :public_folder, 'public'
		set :views, 'app/views'
	end

    # code actions here!
	get "/recipes" do
		@recipes = Recipe.all
		erb :"recipe/all"
	end

	get "/recipes/new" do
		erb :"recipe/new"
	end

	post "/recipes" do
		recipe = Recipe.new(params)
		recipe.valid? ? recipe.save : redirect("/fail")
		@recipe = Recipe.find(recipe.id)
		redirect "/recipes/#{@recipe.id}"
	end

	get "/recipes/:id" do
		@recipe = Recipe.find(params[:id])
		erb :"recipe/show"
	end

	get "/recipes/:id/edit" do
		@recipe = Recipe.find(params[:id])
		erb :"recipe/edit"
	end

	patch "/recipes/:id" do
		recipe = Recipe.find(params[:id])
		recipe.name = params[:name]
		recipe.ingredients = params[:ingredients]
		recipe.cook_time = params[:cook_time]

		recipe.save ? redirect("/recipes/#{recipe.id}") : redirect("/fail")
	end

	delete "/recipes/:id" do
		Recipe.find(params[:id]).destroy
		redirect "/recipes"
	end
end
