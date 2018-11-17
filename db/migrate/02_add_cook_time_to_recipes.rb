class AddCookTimeToRecipes < ActiveRecord::Migration

def change
  add_column :recipes, :cook_time, :integer
end
end
