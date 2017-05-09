class CreateRecepies < ActiveRecord::Migration
  def change
    create_table :recepies  do |r|
      r.string :name
      r.string :ingredients
      r.string :cook_time
  end
end
end
