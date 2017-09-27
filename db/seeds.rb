recipes = [
  ["Dank Mac", "Mac'n'Cheese & Weed", 30],
  ["AwesomeSauce", "30 ounces of awesome", 20],
  ["Killer Cake", "knives, guns, batter", 20]
]

recipes.each do |name, ingredients, cook_time|
  Recipe.create(name: name, ingredients: ingredients, cook_time: cook_time)
end
