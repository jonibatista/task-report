class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = policy_scope(Customer)
    authorize @customers
  end

  # GET /customers/1
  # GET /customers/1.json
  def show; end

  # GET /customers/new
  def new
    @customer = Customer.new
    authorize @customer
  end

  # GET /customers/1/edit
  def edit; end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    authorize @customer

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = policy_scope(Customer).find(params[:id] || params[:customer_id])
    authorize @customer
  end

  # Only allow a list of trusted parameters through.
  def customer_params
    params.require(:customer).permit(:name)
  end
end
