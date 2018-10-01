class UpdateIngredientsToRecipes < ActiveRecord::Migration
  def change
    rename_column :recipes, :indredients, :ingredients 
  end
end
