class CreateProjectUsers < ActiveRecord::Migration
  def change
    create_table :project_users do |t|
      t.integer :user_id
      t.integer :project_id
      t.datetime :joined_date

      t.timestamps null: false
    end
  end
end
