class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :recipes, :time, :cook_time
  end
end
