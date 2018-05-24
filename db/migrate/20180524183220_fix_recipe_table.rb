class FixRecipeTable < ActiveRecord::Migration
  def change
    drop_table :recipe

    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.string :cook_time
    end
  end
end
