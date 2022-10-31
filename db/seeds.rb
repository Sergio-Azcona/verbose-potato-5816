# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@sam = Customer.create!(name: "Sam")
@billy = Customer.create!(name: "Billy")

@moes = Supermarket.create!(name: "Moe's", location: "24 Broadway")
@wholefoods = Supermarket.create!(name: "Whole Foods", location: "45 Turner Drive")
@larrys = Supermarket.create!(name: "Larry's Market", location: "56 Zoo Road")

@banana = Item.create!(name: "Banana", price: 1, supermarket_id: @wholefoods.id)
@apple = Item.create!(name: "apple", price: 2, supermarket_id: @wholefoods.id))
@shake = Item.create!(name: "Milk Shake", price: 4, supermarket_id: @moes.id)
@pasta = Item.create!(name: "Pasta", price: 3, supermarket_id: @larrys.id )
@cannoli = Item.create!(name: "Cannoli", price: 3, supermarket_id: @larrys.id )
@bread = Item.create!(name: "bread", price: 2, supermarket_id: @larrys.id )