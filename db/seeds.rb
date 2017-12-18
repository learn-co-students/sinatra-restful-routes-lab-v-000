# remember that in order to create a migration, you gotta start all this out with this command:
# bundle exec rake db:create_migration NAME=create_recipes

# after that you have to migrate this stuff with the following command:
# bundle exec rake db:migrate SINATRA_ENV=test


# Now here's some seed data if you need it:

Recipe.create(name: "Cookies", ingredients: "sugar, flour, water", cook_time: '25')
Recipe.create(name: "Tofu", ingredients: "Sesame Oil, Teryaki Sauce, Sugar", cook_time: '42')
Recipe.create(name: "Matzah", ingredients: "Whole weat flour, salt, water", cook_time: '26')

# It appears that making the cook_time an integer may have been a mistake; now let's make it
# a string instead!
# bundle exec rake db:create_migration NAME=edit_recipes

# FORMAT:                   change_column(table_name, column_name, type, options = {}) public
# inside the migration put: change_column(:recipes, :cook_time, :string)
