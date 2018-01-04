class Recipes < ActiveRecord::Migration
  def change
    create_table :recipes do |r|
      r.string :ingredients
      r.string :name
      r.string :cook_time
    end
  end
end


#make sure you create a corresponding model for this table recipes
