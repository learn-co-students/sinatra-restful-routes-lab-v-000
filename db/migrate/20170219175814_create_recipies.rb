class CreateRecipies < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.string :cook_time
    end
  end

  def down
    drop_table :recipes
  end
end
