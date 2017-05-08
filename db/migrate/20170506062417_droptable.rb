class Droptable < ActiveRecord::Migration
  def change
    drop_table :recepies
  end
end
