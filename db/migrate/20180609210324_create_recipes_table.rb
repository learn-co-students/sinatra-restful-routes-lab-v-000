class CreateRecipesTable < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.string :cook_time
    end # create_table BLOCK
  end # change METHOD
end # CreateRecipesTable CLASS
