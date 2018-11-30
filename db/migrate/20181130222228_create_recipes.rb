class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |i|
      i.string :name
      i.string :ingredients
      i.string :cook_time
    end
  end
end
