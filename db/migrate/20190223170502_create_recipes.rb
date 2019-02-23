class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |table|
      table.string :name 
      table.string :ingredients
      table.string :cook_time
    end
  end
end
