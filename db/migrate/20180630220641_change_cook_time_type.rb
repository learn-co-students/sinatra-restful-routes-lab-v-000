class ChangeCookTimeType < ActiveRecord::Migration
  def change
    change_table :recipes do |t|
      t.change :cook_time, :string
    end
  end
end
