class AddColumnCookTime < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :cook_time, :string
  end
end
