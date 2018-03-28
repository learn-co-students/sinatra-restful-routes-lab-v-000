class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |r|
      r.string :name
      r.string :ingredients
      r.string :cook_time

    end
  end
end
