class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index]
  before_action :set_item, only:[:index, :create]
  before_action :sure_current_user, only:[:index]
  before_action :sold_out, only:[:index]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code,:prefecture_id,:address_1,:address_2,:building,:phone_number).merge(user_id: current_user.id,item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  def sure_current_user
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def sold_out
    if Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end
end
