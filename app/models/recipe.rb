#Placeholder for a model
class Recipe < ActiveRecord::Base
  def changes
    create_table :recipes do |t|
    t.string :name
    t.string :ingredients
    t.string :cook_time
  end


end