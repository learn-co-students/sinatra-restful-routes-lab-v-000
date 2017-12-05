class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |col|
      col.text :name
      col.text :ingredients
      col.text :cook_time
    end
  end
end
