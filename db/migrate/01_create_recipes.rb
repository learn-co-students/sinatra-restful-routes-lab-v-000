class CreateRecipes < ActiveRecord::Migration
  def up
    create_table :recipes do |t|
        t.string :name
        t.string :ingredients
        t.string :cook_time
    end
  end

# no need for the method below

  def down
    drop_table :recipes
  end
end
