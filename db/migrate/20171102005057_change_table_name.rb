class ChangeTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :receipes , :recipes
  end
end
