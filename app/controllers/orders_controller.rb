class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @order = OrderForm.new
    if @item.user_id == current_user[:id]
      redirect_to root_path
    elsif @item.order
      redirect_to root_path
    end
  end

  def create
    @order = OrderForm.new(order_address_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def order_address_params
    params.permit(:order_form, :postal_code, :city, :house_number, :building_name, :phone_number, :prefectures_id, :order_id, :token).merge(user_id: current_user.id, item_id: params[:id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
