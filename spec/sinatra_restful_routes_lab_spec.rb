require 'spec_helper'

describe "Recipe App" do
  let(:recipe_name) { "Bomb.com Mac and Cheese" }
  let(:recipe_ingredients) { "milk, butter, cheese, elbow pasta" }
  let(:recipe_cook_time) { "20 minutes" }

  before do
    @recipe1 = Recipe.create(:name => recipe_name, :ingredients => recipe_ingredients, :cook_time => recipe_cook_time)
    @recipe2 = Recipe.create(:name => "waldorf salad", :ingredients => "apples, cabbage, oil, vinegar", :cook_time => "0")
  end

  describe "Index page '/recipes'" do
    before do
      get "/recipes"
    end

    it 'responds with a 200 status code' do
      expect(last_response.status).to eq(200)
    end

    it "displays a list of recipes" do
      expect(last_response.body).to include(recipe_name)
      expect(last_response.body).to include(@recipe2.name)

    end

    it "contains links to each recipe's show page" do
      expect(last_response.body).to include("/recipes/#{@recipe1.id}")
    end
  end


  describe "show page '/recipes/:id'" do
    before do
      get "/recipes/#{@recipe1.id}"
    end

    it 'responds with a 200 status code' do
      expect(last_response.status).to eq(200)
    end

    it "displays the recipe's name" do
      expect(last_response.body).to include(recipe_name)

    end

    it "displays the recipe's ingredients" do
      expect(last_response.body).to include(recipe_ingredients)
    end

    it "displays the recipe's cook time" do
      expect(last_response.body).to include(recipe_cook_time)
    end

    it "contains a links to delete the recipe" do
      expect(last_response.body).to include("/recipes/#{@recipe1.id}/delete")
    end
  end

  describe "edit page '/recipes/:id/edit'" do
    before do
      get "/recipes/#{@recipe1.id}/edit"
    end

    it 'responds with a 200 status code' do
      expect(last_response.status).to eq(200)
    end

    it "contains a form to edit the recipe" do
      expect(last_response.body).to include("</form>")

    end

    it "displays the recipe's ingredients before editing" do
      expect(last_response.body).to include(recipe_ingredients)
    end

  end

  describe "new page '/recipes/new'" do
    before do
      get "/recipes/new"
    end

    it 'responds with a 200 status code' do
      expect(last_response.status).to eq(200)
    end

    it "contains a form to create the recipe" do
      expect(last_response.body).to include("</form>")
    end
  end

  describe "creating a new recipe" do
    before do
      params = { "recipe" => {
          "name" => "pumpkin pie",
          "ingredients" => "pumpkin, flour, butter, sugar",
          "cook_time" => "1 hour"
        }
      }

      post '/recipes', params
      follow_redirect!
    end
    it "creates a new recipe and saves to the database" do
      expect(Recipe.all.count).to eq(3)
      expect(Recipe.last.name).to eq("pumpkin pie")
    end

    it "redirects to the recipe show page" do
      expect(last_request.url).to include("/recipes/#{Recipe.last.id}")
    end
  end

  describe "updating a recipe" do
    before do
      @cookie = Recipe.create(
        name:   "Chocolate Chip Cookies",
        ingredients:  "chocolate chips, flour, sugar, butter",
        cook_time:  "30 minutes",
      )
      params = { :recipe => {
          :name   => "Double chocolate chip cookies",
          :ingredients => "chocolate chips, flour, sugar, butter, cocoa powder",
          :cook_time  => "30 minutes",
        }
      }
      post "/recipes/#{@cookie.id}", params
      follow_redirect!
    end

    it "redirects to the recipe show page" do
      expect(last_request.url).to include("/recipes/#{@cookie.id}")
      expect(last_response.body).to include("Double chocolate chip cookies")
      expect(last_response.body).to include("chocolate chips, flour, sugar, butter, cocoa powder")
      expect(last_response.body).to include("30 minutes")
    end
  end

  describe "deleting a recipe" do
    before do
      @cookie = Recipe.create(
        name:   "Chocolate Chip Cookies",
        ingredients:  "chocolate chips, flour, sugar, butter",
        cook_time:  "30 minutes",
      )
      params = { :recipe => {
          :name   => "Double chocolate chip cookies",
          :ingredients => "chocolate chips, flour, sugar, butter, cocoa powder",
          :cook_time  => "30 minutes",
        }
      }
      post "/recipes/#{@cookie.id}", params
      follow_redirect!
    end

    it "deletes a recipe" do
      post "/recipes/#{@cookie.id}/delete"
      expect(Recipe.find_by_id(@cookie.id)).to eq(nil)
    end
  end

end
