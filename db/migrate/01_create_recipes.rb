class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |x|
      x.string :name
      x.string :ingredients
      x.integer :cook_time
    end
  end
end