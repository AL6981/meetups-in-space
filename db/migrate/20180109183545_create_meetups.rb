class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :creator, null: false
      t.text :description, null: false
    end
  end
end
