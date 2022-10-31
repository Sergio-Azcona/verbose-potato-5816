require 'rails_helper'

RSpec.describe "Item Index Page" do
  before (:each) do
    @sam = Customer.create!(name: "Sam")
    @billy = Customer.create!(name: "Billy")

    @moes = Supermarket.create!(name: "Moe's", location: "24 Broadway")
    @wholefoods = Supermarket.create!(name: "Whole Foods", location: "45 Turner Drive")
    @larrys = Supermarket.create!(name: "Larry's Market", location: "56 Zoo Road")

    @banana = Item.create!(name: "Banana", price: 1, supermarket_id: @wholefoods.id)
    @apple = Item.create!(name: "apple", price: 2, supermarket_id: @wholefoods.id)
    @shake = Item.create!(name: "Milk Shake", price: 4, supermarket_id: @moes.id)
    @pasta = Item.create!(name: "Pasta", price: 3, supermarket_id: @larrys.id)
    @cannoli = Item.create!(name: "Cannoli", price: 3, supermarket_id: @larrys.id)
    @bread = Item.create!(name: "bread", price: 2, supermarket_id: @larrys.id)
  end

  describe "story 3" do
    describe "When I visit the items index page" do
      before (:each) do
        visit ("/items")
      end

      it "has a list of all items including the item's name, price, and the name of the supermarket that it belongs to" do
        @sam.items << @bread << @shake
        save_and_open_page
        expect(page).to have_content ("#{@bread.name}")
        expect(page).to have_content ("#{@bread.price}")
        expect(page).to have_content("#{@bread.supermarket_id}")
      end


      xit "and the count of customers that bought that item" do
      end
    end
  end
end