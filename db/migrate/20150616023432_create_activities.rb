class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :action
      t.string :object
      t.text :description

      t.timestamps null: false
    end
  end
end
