class RemoveCookTimeFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :cook_time, :string
  end
end
