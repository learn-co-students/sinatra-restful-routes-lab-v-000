class EditIntegerFieldInRecipes < ActiveRecord::Migration
  def change
  	rename_column :recipes, :integer, :cook_time
  end
end
