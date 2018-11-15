class CreateTable < ActiveRecord::Migration
  create_table :recipes do |r|
    r.string :name
    r.string :ingredients
    r.string :cook_time
  end
end