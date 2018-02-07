10.times do |i|
  Recipe.create(:name => "RECIPE #{i}",:ingredients => "Ingredients #{i}", :cook_time => "#{i} HOURS")
end
