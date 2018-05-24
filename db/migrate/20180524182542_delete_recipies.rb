class DeleteRecipies < ActiveRecord::Migration
  def change
    drop_table :recipies
  end
end
