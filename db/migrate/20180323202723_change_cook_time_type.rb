class ChangeCookTimeType < ActiveRecord::Migration[5.1]
  def change
    change_column :recipes, :cook_time, :integer
  end
end
