class Recipe < ActiveRecord::Base


end

bananas = "bananas"
ban = Recipe.new(name: "bananas", ingredients: bananas, cook_time: "1min")
ban.save