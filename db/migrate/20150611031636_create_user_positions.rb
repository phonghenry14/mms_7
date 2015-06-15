class CreateUserPositions < ActiveRecord::Migration
  def change
    create_table :user_positions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :position, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
