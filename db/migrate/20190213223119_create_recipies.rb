class CreateRecipies < ActiveRecord::Migration
  def change
      create_table :recipes do |t|
          t.string :name
          t.string :ingredient
      end
  end
end
