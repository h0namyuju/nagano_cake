class Admin::ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
    @items = Item.all
  end

  def create
    @item = Item.new(admin_item_params)
    @item.save!
    redirect_to admin_item_path(@item)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
     @item = Item.find(params[:id])
     @item.update
     redirect_to admin_item_path
  end

  private
  def admin_item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :genre_id)

  end
end
