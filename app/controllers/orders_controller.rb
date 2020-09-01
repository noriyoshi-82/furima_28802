class OrdersController < ApplicationController
  before_action :authenticate_user!
  

  def index
    @item = Item.find(params[:id])
    if @item.user_id == current_user[:id]
      redirect_to root_path
    end
    
    if @item.order
      redirect_to root_path
    end
  end

end


