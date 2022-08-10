class Public::ItemsController < ApplicationController
  def index
    @genre = Genre.find(params[:id])
    @item = Item.all
  end

  def show
  end
end
