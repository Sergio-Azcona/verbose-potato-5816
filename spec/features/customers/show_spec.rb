require 'rails_helper'

RSpec.describe "Costumer Show Page" do
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
  
  describe "When I visit a customer show page" do
    before(:each)do
      visit ("/customers/#{@sam.id}")
    end
    
    it "displays the customer's name, And I see its a list of its items" do
      expect(page).to have_content("#{@sam.name}")
    end
    
    
    it "including the item's name, price, and the name of the supermarket that it belongs to" do
      @sam.items << @bread << @shake
      @chocolate = @moes.items.create!(name: "Chocolate", price: 1)
      @pie = @sam.items.create(name: "Pumpkin Pie", price: 7, supermarket_id: @moes.id)
      @sam.items << @chocolate
      
      # save_and_open_page
      expect(page).to have_content("#{@bread.name}")
      expect(page).to have_content("#{@bread.price}")
      expect(page).to have_content("#{@bread.supermarket_id.name}")

      expect(page).to have_content("#{@shake.name}")      
    end
  end
end