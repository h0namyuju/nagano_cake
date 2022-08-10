class Public::OrdersController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def comfirm
  end

  def complate
  end

  def create
  end

end

# 購入情報の入力画面で、宛先や住所などを入力するところです
def new
  @order = Order.new
end

# 購入を確定します
def create # Order に情報を保存します
  cart_items = current_customer.cart_items.all
# ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
  @order = current_customer.orders.new(order_params)
# 渡ってきた値を @order に入れます
  if @order.save
# ここに至るまでの間にチェックは済ませていますが、念の為IF文で分岐させています
    cart_items.each do |cart|
# 取り出したカートアイテムの数繰り返します
# order_item にも一緒にデータを保存する必要があるのでここで保存します
      order_item = OrderItem.new
      order_item.item_id = cart.item_id
      order_item.order_id = @order.id
      order_item.order_quantity = cart.quantity
# 購入が完了したらカート情報は削除するのでこちらに保存します
      order_item.order_price = cart.item.price
# カート情報を削除するので item との紐付けが切れる前に保存します
      order_item.save
    end
    redirect_to 遷移したいページのパス
    cart_items.destroy_all
# ユーザーに関連するカートのデータ(購入したデータ)をすべて削除します(カートを空にする)
  else
    @order = Order.new(order_params)
    render :new
  end
end

# new 画面から渡ってきたデータをユーザーに確認してもらいます
#def check
 # @order = Order.new(order_params)
# new 画面から渡ってきたデータを @order に入れます
#  if params[:order][:address_number] == "1"
# view で定義している address_number が"1"だったときにこの処理を実行します
# form_with で @order で送っているので、order に紐付いた address_number となります。以下同様です
# この辺の紐付けは勉強不足なので gem の pry-byebug を使って確認しながら行いました
 #   @order.name = current_customer.name # @order の各カラムに必要なものを入れます
  #  @order.address = current_customer.customer_address
 # elsif params[:order][:address_number] == "2"
# view で定義している address_number が"2"だったときにこの処理を実行します
  #  if Address.exists?(name: params[:order][:registered])
# registered は viwe で定義しています
