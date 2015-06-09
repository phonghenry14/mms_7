class CreateUserskills < ActiveRecord::Migration
  def change
    create_table :userskills do |t|
      t.integer :level
      t.integer :year
      t.references :user, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
