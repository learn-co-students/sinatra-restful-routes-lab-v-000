class Recipe < ActiveRecord::Base
end

Recipe.create(name: "test", ingredients: "test ingredients")
