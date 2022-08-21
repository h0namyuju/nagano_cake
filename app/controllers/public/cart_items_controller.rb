class Public::CartItemsController < ApplicationController
  def index
       @cart_item = CartItem.all
       @item = Item.all

  end

  def update
  end

  def destroy
       @cart_item = CartItem.find(params[:id])
    if @cart_item.customer.id = current_customer.id
       @cart_item.destroy
       render cart_item/index
    end
  end

  def destroy_all
  end

  def create

       @cart_item = CartItem.new(cart_item_params)
       @cart_item.customer_id = current_customer.id
       @cart_item.save
    redirect_to public_cart_items_path
  end


  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :cucstomer_id)
  end
end