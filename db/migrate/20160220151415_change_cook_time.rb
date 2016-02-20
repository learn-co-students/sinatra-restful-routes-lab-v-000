class ChangeCookTime < ActiveRecord::Migration
  def up
  	change_column :recipes, :cook_time, :string
  end
  def down
  	change_column :resipes, :cook_time, :date_time
  end
end
