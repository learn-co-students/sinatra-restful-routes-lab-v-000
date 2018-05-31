#Placeholder for a model
class Recipe < ActiveRecord::Base
  validates_presence_of :name, :ingredients, :cook_time
  # has_secure_password
end