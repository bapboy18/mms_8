class CreatePositionUsers < ActiveRecord::Migration
  def change
    create_table :position_users do |t|
      t.string :user_id
      t.string :position_id
      t.datetime :start_date

      t.timestamps null: false
    end
  end
end
