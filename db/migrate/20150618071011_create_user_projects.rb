class CreateUserProjects < ActiveRecord::Migration
  def change
    create_table :user_projects do |t|
      t.references :user
      t.references :project
      t.timestamps null: false
    end
  end
end
