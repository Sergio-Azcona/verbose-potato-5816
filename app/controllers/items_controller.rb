class ItemsController < ApplicationController

  def index
    @items = Item.all

    # require 'pry';binding.pry
    # @market = Supermarket.find_by(params[:id])
  end

end