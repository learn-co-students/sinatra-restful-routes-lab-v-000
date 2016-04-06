class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :recipes, :indgredients, :ingredients
  end
end
