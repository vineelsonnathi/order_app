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
    @user.build_address if !@user.address.present?
  end

  def step3
    @user.attributes = user_params
    if @user.save
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

  def user_params
    params.require(:user).permit(:first_name, :middle_initial, :last_name,
      :address_attributes => [:street_name_1, :street_name_2, :city, :state, :zip, :zip_plus_four ]
      )
  end

  def set_step
    @product = Product.find(params[:id])
  end

end
