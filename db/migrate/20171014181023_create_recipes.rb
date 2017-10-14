class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |col|
      col.string :name
      col.text :ingredients
      col.string :cook_time
    end
  end
end
