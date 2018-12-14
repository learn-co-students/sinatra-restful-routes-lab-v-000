class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |recipe|
      recipe.string :name
      recipe.text :ingredients
      recipe.decimal :cook_time
    end
  end
end
