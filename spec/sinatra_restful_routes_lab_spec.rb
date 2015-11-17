require 'spec_helper'

describe "Recipe App" do
  let(:recipe_name) { "Bomb.com Mac and Cheese" }
  let(:recipe_ingredients) { "milk, butter, cheese, elbow pasta" }
  let(:recipe_cook_time) { "20 minutes" }

  before do
    @recipe1 = Recipe.create(name: recipe_name, ingredients recipe_ingredients, cook_time: recipe_cook_time)
    @recipe2 = Recipe.create(name: "waldorf salad", ingredients: "apples, cabbage, oil, vinegar", "0")
  end

    describe "Index page '/recipes'" do
      before do
        visit "/recipes"
      end

      it 'responds with a 200 status code' do
        visit '/recipes'
        expect(page.status_code).to eq(200)
      end

      it "displays a list of songs" do
        expect(page).to have_content(recipe_name)
      end

      it "contains links to each song's show page" do
        expect(page).to have_css("a[href='/recipes/#{@recipe.id}']")
      end
    end

    
    describe "show page '/recipes/:id'" do
      before do
        visit "/recipes/#{@recipe1.id}"
      end

      it 'responds with a 200 status code' do
        visit "/recipes/#{@recipe1.id}"
        expect(page.status_code).to eq(200)
      end

      it "displays the recipe's artist" do
        expect(page).to have_content(recipe_name)
        expect(page).to have_content(@recipe2.name)

      end

      it "displays the recipe's ingredients" do
        expect(page).to have_content(recipe_ingredients)
      end

      it "displays the recipe's cook time" do
        expect(page).to have_content(recipe_cook_time)
      end

      it "contains a links to delete the recipe" do
        expect(page).to have_css("a[href='/recipes/#{@recipe1.id}/delete']")
      end
    end

    describe "edit page '/recipes/:id/edit'" do
      before do
        visit "/recipes/#{@recipe1.id}/edit"
      end

      it 'responds with a 200 status code' do
        visit "/recipes/#{@recipe1.id}/edit"
        expect(page.status_code).to eq(200)
      end

      it "contains a form to edit the recipe" do
        expect(page).to have_content("</form>")

      end

      it "displays the recipe's ingredients before editing" do
        expect(page).to have_content(recipe_ingredients)
      end

    end

    describe "new page '/recipes/new'" do
      before do
        visit "/recipes/new"
      end

      it 'responds with a 200 status code' do
        visit "/recipes/new"
        expect(page.status_code).to eq(200)
      end

      it "contains a form to create the recipe" do
        expect(page).to have_content("</form>")
      end

    end

    
end