# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

user1 = User.create(provider: "provider", uid: "string", username: "Amy", email: "amylynn@gmail.com", avatar_url: "https:www.google.com")

user2 = User.create(provider: "provider2", uid: "string2", username: "Bob", email: "bobble@gmail.com", avatar_url: "https:www.google1.com")

meetup1 = Meetup.create(name: "fun time", location: "Launch", creator: "Me", description: "drinks and games")

meetup2 = Meetup.create(name: "fun time Friday", location: "Launch Philly", creator: "Me2", description: "many drinks and games")
