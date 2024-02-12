class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @orderform = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
      @orderform.save
      redirect_to root_path
  else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end