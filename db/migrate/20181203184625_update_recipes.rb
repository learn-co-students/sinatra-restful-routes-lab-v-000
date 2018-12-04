class UpdateRecipes < ActiveRecord::Migration
  def change
    change_table :recipes do 
      change_column :recipes, :cook_time, :string
    end
  end
end
