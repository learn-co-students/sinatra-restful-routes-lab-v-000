class CreateRecipes < ActiveRecord::Migration

  def change
        create_table :recipes do |column|
          column.string :name
          column.string :ingredients
          column.string :cook_time
        end
    end

end
