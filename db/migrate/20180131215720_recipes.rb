class Recipes < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :ingredients
      t.string :cook_time
    end
  end
end
