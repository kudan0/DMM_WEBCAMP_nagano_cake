class Public::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders
  end

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def show
    @orders = current_customer.orders
    @order = Order.find(params[:id])
  end

  def confirm
    @cart_items = current_customer.cart_items
    @sub_total = 0

    @cart_items.each do |cart|
    @sub_total += cart.item.tax_included_price.floor * cart.quantity
    end

    @order = Order.new
    @order.customer_id = current_customer.id
    @order.buy_status = 0
    @order.shipping_cost = 800
    @order.pay_type = params[:order][:pay_type]

    @order_address = params[:order][:address_option]

    if @order_address == "1"

     @order.postcode = current_customer.postcode
     @order.address = current_customer.address
     @order.name = current_customer.last_name + current_customer.first_name

    elsif @order_address == "2"

     @address = Address.find(params[:order][:address_id])
     @order.postcode =  @address.postcode
     @order.address =  @address.address
     @order.name = @address.name

    elsif @order_address == "3"

     @order.postcode = params[:order][:postcode]
     @order.address = params[:order][:address]
     @order.name = params[:order][:name]

     @address = current_customer.addresses.new
     @address.postcode = params[:order][:postcode]
     @address.address = params[:order][:address]
     @address.name = params[:order][:name]
      if @address.save
        flash[:notice] = "新しい住所が登録されました"
      else
        flash[:alert] = "正しい住所を入力してください"
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.total_price = @order.cal_price(current_customer)
    @order.shipping_cost = 800
    @order.save

    order_details_maker(@order)

    redirect_to complete_orders_path
  end

  def complete
  end

  private

  def order_details_maker(order)

    cart_items = current_customer.cart_items

    cart_items.each do |cart_item|
      order_items = OrderItem.new

      order_items.item_id = cart_item.item_id
      order_items.order_id = order.id
      order_items.quantity = cart_item.quantity
      order_items.make_status = 0
      order_items.price = cart_item.item.price
      order_items.save
    end

    cart_items.destroy_all

  end

  def order_params
    params.require(:order).permit(:pay_type, :address, :postcode, :name, :total_price )
  end

end