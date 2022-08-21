class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @item = Item.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end



  private
  def public_item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :genre_id, :amount)
  end
end

