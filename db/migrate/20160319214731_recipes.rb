class Recipes < ActiveRecord::Migration
  def up
    create_table :recipes do |t|
      t.string :name
      t.text :ingredients
      t.string :cook_time
    end
  end

  def down
    drop_table :recipes
  end
end