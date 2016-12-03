class CreateRecipes < ActiveRecord::Migration
  def up
    create_table :recipes do |r|
        r.string :name
        r.string :ingredients
        r.string :cook_time
    end
  end

  def down
    drop_table :recipes
  end
end
