class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :ensure_current_user, only: [:update, :destroy, :edit]
  before_action :sold_out, only: [:edit]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:name, :details, :price, :category_id, :postage_id, :prefecture_id, :shipping_date_id, :status_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def ensure_current_user
    redirect_to action: :index if @item.user_id != current_user.id
  end

  def sold_out
    redirect_to root_path if Order.exists?(item_id: @item.id)
  end
end
