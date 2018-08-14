class Recipe < ActiveRecord::Base
    validates :name, presence: true
    validates :ingredients, presence: true
    validates :cook_time, presence: true 
end