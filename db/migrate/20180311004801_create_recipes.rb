class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.string :cook_time #what format for this? string/decimal
    end
  end
end



#first, bundle exec rake db:create_migration NAME=create_post
#had to use bundle exec rake db:migrate SINATRA_ENV=test
