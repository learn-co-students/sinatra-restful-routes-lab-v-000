class EditTableName < ActiveRecord::Migration

  def change
    rename_table :receipes, :recipes
  end

end