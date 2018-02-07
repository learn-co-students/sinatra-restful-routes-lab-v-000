class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.text :name
      t.text :ingredients
      t.integer :cook_time
    end
  end
end
