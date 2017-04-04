class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :get_amount, only: [:step2]
  before_action :find_user, only: [:step2, :step3]

  # GET /products
  # GET /products.json
  def step1
    @products = Product.all
  end

  def step2
    @address = @user.build_address
  end

  def step3
    @user.attributes = user_params
    @user.save
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def get_amount
      total_amount = params[:total_amount]
      session[:total_amount] = total_amount
      if total_amount.to_i == 0
        redirect_to products_path, notice: 'Please select atleast one product'
      end
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :middle_initial, :last_name,
        :address_attributes => [:street_name_1, :street_name_2, :city, :state, :zip, :zip_plus_four ]
        )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end

    def find_user
      @user = User.find_by_email(current_user.email)
    end
end
