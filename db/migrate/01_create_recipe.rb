class CreateRecipe < ActiveRecord::Migration[5.1]

  def up
  create_table  :recipes do |t|
       t.string :name
       t.string :ingredients
       t.string :cook_time
   end
  end


  def down
    drop_table :recipes

  end

end
