class Public::CartItemsController < ApplicationController
  def index
       @cart_item = CartItem.all
       @item = Item.all

  end

  def update
       @cart_item = CartItem.find(params[:id])
       @cart_item.customer.id = current_customer.id
       @cart_item.update(cart_item_params)
       redirect_to public_cart_items_path
  end

  def destroy
       @cart_item = CartItem.find(params[:id])
       @cart_item.customer.id = current_customer.id
       @cart_item.destroy
       redirect_to public_cart_items_path
  end

  def destroy_all
       current_customer.cart_items.destroy_all
       redirect_to public_cart_items_path
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