# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'a', password: 'bbb', password_confirmation: 'bbb')

User.create(email: 'b', password: 'ccc', password_confirmation: 'ccc')

#Item.create(name: 'A bridge', description: 'This is a nice...bridge', image: 'public/uploads/item/image/1/Bridge.png', user_id: 1)

#Item.create(name: 'A fractal tree', description: 'Isn\'t this pretty?', image: 'public/uploads/item/image/2/icon.png', user_id: 2)