class Public::HomesController < ApplicationController

  def top
    @genre = Genre.all
  end

  def  about
  end

  private
  def customer_params
      params.require(:customer).permit(:id)
  end
end