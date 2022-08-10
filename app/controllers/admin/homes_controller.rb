class Admin::HomesController < ApplicationController
  def top
    @customer = Customer.all
    @order = Order.all

  end
end
