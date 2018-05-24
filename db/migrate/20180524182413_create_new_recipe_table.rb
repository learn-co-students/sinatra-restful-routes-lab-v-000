class CreateNewRecipeTable < ActiveRecord::Migration
  def up
    create_table :recipe do |t|
      t.string :name
      t.string :ingredients
      t.string :cook_time
    end
  end

  def down
    drop_table :recipies
  end
end
