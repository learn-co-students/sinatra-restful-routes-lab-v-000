class ChangeCooktime < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :recipes do |t|
        dir.up {t.change :cook_time, :string}
        dir.down {t.change :cook_time, :integer}
      end
    end
  end
end
