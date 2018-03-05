class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |recipe|
      recipe.string :name
      recipe.string :ingredients
      recipe.integer :cook_time
    end
  end
end
