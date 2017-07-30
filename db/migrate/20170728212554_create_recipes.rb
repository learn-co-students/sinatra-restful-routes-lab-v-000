class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :Recipes do |t|
             t.string :name
             t.string :ingredients
             t.string :cook_time
    end
  end
end
