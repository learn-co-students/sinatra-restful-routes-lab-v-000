class CreateRecipes < ActiveRecord::Migration
  
  def change
    create_table :recipes do |u|
      u.string :name
      u.string :ingredients
      u.integer :cook_time
    end
  end
  
end
