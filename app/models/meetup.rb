class Meetup < ActiveRecord::Base
  has_many :meetups_and_users
  has_many :users, through: :meetups_and_users
  validates :name, presence: true
  validates :location, presence: true
  validates :creator, presence: true
  validates :description, presence: true
end
