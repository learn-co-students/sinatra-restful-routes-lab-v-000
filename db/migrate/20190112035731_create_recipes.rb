class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |c|
      c.string :name
      c.string :ingredients
      c.string :cook_time
    end
  end
end
