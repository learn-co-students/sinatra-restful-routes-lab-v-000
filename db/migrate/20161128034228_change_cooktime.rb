class ChangeCooktime < ActiveRecord::Migration[5.0]
  def change
    change_column :recipes, :cook_time, :integer
  end
end
