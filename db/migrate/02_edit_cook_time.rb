class EditCookTime < ActiveRecord::Migration

def change
      change_column(:recipes, :cook_time, :string)
  end #ends method

end
