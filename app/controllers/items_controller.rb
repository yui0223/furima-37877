class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:destroy, :edit, :update, :show]

  def index
    @item = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @item.user_id && current_user.id
      @item.destroy
      redirect_to root_path(@item)
    else
      redirect_to root_path(@item)
    end
  end

  def edit
    if current_user.id == @item.user_id && @item.order.nil?
    else
      redirect_to root_path 
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id,
                                 :shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
