class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to public_customer_path(@customer.id)
  end

  def confirm
  end

  def destroy
    @customer = current_customer
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: "false")
    redirect_to _root_path
  end

  private
  def customer_params
    params.require(:customer).permit(
      :last_name, :first_name,
      :last_name_kana, :first_name_kana,
      :email, :postal_code,
      :address, :telephone_number, :is_active
      )
end
