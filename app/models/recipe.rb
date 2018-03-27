class Recipe < ActiveRecord::Base
  validates :name, :ingredients, :cook_time, presence: true
end
