# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
swastik = User.create(email: "swastik@aceteq.co", name: "Swastik", password: "hihello")
akhil = User.create(email: "akhil@outlook.com", name: "Akhil", password: "hihello")

10.times do
  user = [swastik, akhil].sample
  Project.create(name: "#{user.name}'s project", created_by: user)
end
