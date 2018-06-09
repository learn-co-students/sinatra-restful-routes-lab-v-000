class ChangeCookTimeToString < ActiveRecord::Migration
  def up
    change_column :recipes, :cook_time, :string
  end
end
