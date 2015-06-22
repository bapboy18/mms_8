class CreateSkillUsers < ActiveRecord::Migration
  def change
    create_table :skill_users do |t|
      t.integer :user_id
      t.integer :skill_id
      t.string :level
      t.integer :year

      t.timestamps null: false
    end
  end
end
