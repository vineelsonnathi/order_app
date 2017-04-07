class StepsController < ApplicationController
  before_action :set_step, only: [:show]
  before_action :get_amount, only: [:step2]
  before_action :find_user, only: [:step2, :step3]

  def show
  end

  def step1
    @products = Product.all
  end

  def step2
    session[:product_ids] = params[:product_ids].map{|t| t.split(",").last.to_i} if params[:product_ids].present?
    @address = Address.new
  end

  def step3
    @address = Address.new(address_params)
    @address.product_ids = session[:product_ids]
    if @address.save
    else
      render :step2
    end
  end

  private

  def get_amount
    total_amount = params[:total_amount]
    session[:total_amount] = total_amount
    if total_amount.to_i == 0
      redirect_to step1_steps_path, notice: 'Please select atleast one product'
    end
  end

  def find_user
    @user = User.find_by_email(current_user.email)
  end

  def address_params
    params.require(:address).permit(:address_1, :address_2, :city, :state, :zip, :first_name, :last_name, :product_ids, :email, :phone_number)
  end

  def set_step
    @product = Product.find(params[:id])
  end

end
