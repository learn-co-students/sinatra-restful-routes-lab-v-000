class SpellRecipeCorrectly < ActiveRecord::Migration
  def change
    rename_table('recipies', 'recipe')
  end
end
