class CreateRecipes < ActiveRecord::Migration
  def change
     create_table :recipes do |t| #pass name of table we want to create as a symbol
        t.string :name
        t.string :ingredients
        t.string :cook_time
    end
  end
end
