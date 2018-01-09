class CreateRecipes < ActiveRecord::Migration
  def up
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.string :cook_time 
    end
  end
end
