class Recipe < ActiveRecord::Base
  @@recipes = []

  def initialize
    @@recipes << self
  def self.all
    @@recipes
  end
end
