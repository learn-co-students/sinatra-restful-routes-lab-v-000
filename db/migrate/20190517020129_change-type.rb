class Change_Type < ActiveRecord::Migration
  def up
      change_column :recipes, :cook_time, :string
  end

  def down
     change_column :recipes, :cook_time, :time
  end
end
