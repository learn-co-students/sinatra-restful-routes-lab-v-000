class Recipes < ActiveRecord::Migration[5.1]
  def change
    create_table :receipes do |t|
      t.string   :name
      t.string   :ingredients
      t.string   :cook_time
    end
  end
end
