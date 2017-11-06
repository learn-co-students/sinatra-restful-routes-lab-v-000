class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :recipes, :cooking_time, :cook_time
  end
end
