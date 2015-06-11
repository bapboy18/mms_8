class CreateTeamUsers < ActiveRecord::Migration
  def change
    create_table :team_users do |t|
      t.string :user_id
      t.string :team_id
      t.datetime :joined_date

      t.timestamps null: false
    end
  end
end
