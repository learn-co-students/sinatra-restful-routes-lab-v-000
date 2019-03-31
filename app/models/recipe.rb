#Placeholder for a model
class Recipe

attr_accessor :name, :ingredients, :cook_time

RECIPES = []

def initialize(params)
  @recipe = params([: name, :ingredients, :cook_time])





end
