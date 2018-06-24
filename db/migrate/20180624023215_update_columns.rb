class UpdateColumns < ActiveRecord::Migration
  def change
    rename_column :recipes, :recipe_name, :name
    rename_column :recipes, :recipe_ingredients, :ingredients
  end
end
