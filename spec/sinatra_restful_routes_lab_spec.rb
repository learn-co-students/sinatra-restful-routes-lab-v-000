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
      visit "/recipes"
    end

    it 'responds with a 200 status code' do
      expect(page.status_code).to eq(200)
    end

    it "displays a list of recipes" do
      expect(page.body).to include(recipe_name)
      expect(page.body).to include(@recipe2.name)
    end

    it "contains links to each recipe's show page" do
      all_link_hrefs = page.all(:css, "a[href]").map do |element|
        element[:href]
      end
      expect(all_link_hrefs).to include("/recipes/#{@recipe1.id}")
      expect(all_link_hrefs).to include("/recipes/#{@recipe2.id}")
    end

  end


  describe "show page '/recipes/:id'" do
    before do
      visit "/recipes/#{@recipe1.id}"
    end

    it 'responds with a 200 status code' do
      expect(page.status_code).to eq(200)
    end

    it "displays the recipe's name" do
      expect(page.body).to include(recipe_name)
    end

    it "displays the recipe's ingredients" do
      expect(page.body).to include(recipe_ingredients)
    end

    it "displays the recipe's cook time" do
      expect(page.body).to include(recipe_cook_time)
    end

    it "contains a form to delete the recipe" do
      expect(page.find(:css, "form")[:action]).to eq("/recipes/#{@recipe1.id}")
    end

    it 'deletes via a DELETE request' do
      expect(page.find(:css, "form input[name=_method]", :visible => false)[:value]).to match(/delete/i)
    end
  end

  describe "edit page '/recipes/:id/edit'" do
    before do
      visit "/recipes/#{@recipe1.id}/edit"
    end

    it 'responds with a 200 status code' do
      expect(page.status_code).to eq(200)
    end

    it "contains a form to edit the recipe" do
      expect(page.body).to include("</form>")
    end

    it "displays the recipe's ingredients before editing" do
      expect(page.body).to include(recipe_ingredients)
    end

    it "submits via a patch request" do
      expect(page.find(:css, "form input[name=_method]", :visible => false)[:value]).to match(/patch/i)
    end

  end

  describe "new page '/recipes/new'" do
    before do
      visit "/recipes/new"
    end

    it 'responds with a 200 status code' do
      expect(page.status_code).to eq(200)
    end

    it "contains a form to create the recipe" do
      expect(page.body).to include("</form>")
    end

    it "posts the form back to create a new recipe" do

      fill_in :name, :with => "Enchiladas con Salsa Verde"
      fill_in :ingredients, :with => "Tortillas, Queso Blanco, Tomatillos, Onion, Garlic, Black beans, Cilantro"
      fill_in :cook_time, :with => "20 minutes"

      page.find(:css, "[type=submit]").click

      expect(page).to have_content("Enchiladas con Salsa Verde")
      expect(page).to have_content("Tortillas, Queso Blanco, Tomatillos, Onion, Garlic, Black beans, Cilantro")
      expect(page).to have_content("20 minutes")

    end
  end

  describe "creating a new recipe" do
    before do
      params = {
        "name" => "pumpkin pie",
        "ingredients" => "pumpkin, flour, butter, sugar",
        "cook_time" => "1 hour"
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

      visit "/recipes/#{@cookie.id}/edit"

      fill_in :name, :with => "Double chocolate chip cookies"
      fill_in :ingredients, :with => "chocolate chips, flour, sugar, butter, cocoa powder"
      fill_in :cook_time, :with => "30 minutes"

      page.find(:css, "[type=submit]").click
    end

    it "updates the recipe" do
      expect(page).to have_content("Double chocolate chip cookies")
      expect(page).to have_content("chocolate chips, flour, sugar, butter, cocoa powder")
      expect(page).to have_content("30 minutes")
    end

    it "redirects to the recipe show page" do
      expect(page.current_path).to eq("/recipes/#{@cookie.id}")
    end

  end

  describe "deleting a recipe" do

    before do
      @cookie = Recipe.create(
        name:   "Chocolate Chip Cookies",
        ingredients:  "chocolate chips, flour, sugar, butter",
        cook_time:  "30 minutes",
      )
      visit  "/recipes/#{@cookie.id}"

      click_button "delete"
    end

    it "deletes a recipe" do
      expect(Recipe.find_by_id(@cookie.id)).to eq(nil)
    end

  end

end
