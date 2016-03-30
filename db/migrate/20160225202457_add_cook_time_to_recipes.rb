class AddCookTimeToRecipes < ActiveRecord::Migration
  def change
    change_table :recipes do |t|
      t.string :cook_time
    end
  end
end
