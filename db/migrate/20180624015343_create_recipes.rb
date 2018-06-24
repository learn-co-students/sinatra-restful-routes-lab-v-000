class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.string :recipe_ingredients
      t.string :cook_time
    end
  end
end
