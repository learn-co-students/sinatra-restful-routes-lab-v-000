class CreateRecipesTable < ActiveRecord::Migration
  def up
    create_table :recipes do |t|
      t.string :ingredients
      t.string :cook_time
    end
  end

  def down
    drop_table :recipes
  end
end
