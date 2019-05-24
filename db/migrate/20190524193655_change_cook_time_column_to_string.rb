class ChangeCookTimeColumnToString < ActiveRecord::Migration
  def change
    change_column :recipes, :cook_time, :string
  end
end
