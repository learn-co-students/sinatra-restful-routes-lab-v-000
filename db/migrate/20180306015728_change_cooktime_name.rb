class ChangeCooktimeName < ActiveRecord::Migration
  def change
     rename_column :recipes, :cooktime, :cook_time
  end
end
