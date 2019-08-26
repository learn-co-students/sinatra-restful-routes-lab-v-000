class CreateRecipesTable < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name 
      t.string :ingredients
      t.string :cook_time
    end 
  end
end

# Note: I think the convention is to name this migration CreateRecipes, not CreateRecipesTable.