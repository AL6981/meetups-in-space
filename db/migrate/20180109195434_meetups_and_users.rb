class MeetupsAndUsers < ActiveRecord::Migration
  def change
    create_table :meetups_and_users, id: false do |t|
      t.belongs_to :user, index:true
      t.belongs_to :meetup, index:true
    end
  end

end
