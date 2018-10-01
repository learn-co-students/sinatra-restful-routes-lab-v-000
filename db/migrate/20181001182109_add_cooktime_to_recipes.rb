class AddCooktimeToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :cooktime, :string
  end
end
