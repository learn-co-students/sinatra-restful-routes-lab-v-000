class CreateCook < ActiveRecord::Migration[5.1]
  def change
    change_column :recipes, :cook_time, :string
  end
end
