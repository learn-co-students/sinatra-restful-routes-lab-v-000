class Recipe < ActiveRecord::Base
  @@recipes = []

  def initialize
    @@recipes << self
  end
  
  def self.all
    @@recipes
  end
end
