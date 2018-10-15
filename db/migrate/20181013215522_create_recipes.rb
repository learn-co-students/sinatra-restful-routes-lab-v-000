class CreateRecipes < ActiveRecord::Migration
  def change
      create_table :recipes do |t|
        t.string :name
        t.text :ingredients
        t.time :cook_time
    end
  end
end
