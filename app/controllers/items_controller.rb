class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @items = Item.new(item_params)
  if 
    @items.save
    redirect_to root_path(@item)
  else
    render :new
  end
end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end


