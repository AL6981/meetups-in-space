class EditMeetupsAndUsersColumns < ActiveRecord::Migration
  def change
    change_table :meetups_and_users do |t|
      t.remove :user, :meetup
      t.integer :user_id, null: false
      t.integer :meetup_id, null: false
    end
  end
end
