class Recipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name 
      t.string :ingredients
      t.timestamp :cook_time
    end
  end
end
