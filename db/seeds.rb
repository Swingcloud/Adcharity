# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create!(
	email: 'adcharity@adcharity.site',
	password: 'accamp',
	password_confirmation: 'accamp',
	admin: true
)

Advertisement.create!(
	ad_href: 'https://www.youtube.com/watch?v=3hzndQqJZbM',
	price_per_look: 3,
	name: '【鮮乳坊】這一瓶鮮奶是怎麼來的')
