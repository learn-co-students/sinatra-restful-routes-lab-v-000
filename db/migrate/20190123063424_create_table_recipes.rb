class CreateTableRecipes < ActiveRecord::Migration
  def change
  	create_table :recipes do |t|
  		t.string :name
  		t.string :ingredients
  		t.string :integer
  	end
  end
end
