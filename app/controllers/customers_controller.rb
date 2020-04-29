class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_customer, only: [:index, :edit, :update]
  before_action :correct_customer,   only: [:edit, :update]
  before_action  :admin_user, only: :destroy

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.paginate(page: params[:page], per_page: 10)
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @issues = @customer.issues.paginate(page: params[:page], per_page: 10)
    @issue = current_user.issues.build if logged_in?
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        log_in @customer
        flash[:success] = "Welcome to NCI Soccer Games! You can now submit your requests"
        format.html { redirect_to root_url}
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
        flash[:success] = "Profile updated"
        format.html { redirect_to @customer}
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
    flash[:success] = "The customer profile has been deleted!"
    respond_to do |format|
      format.html { redirect_to root_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :email, :password, :password_confirmation, :address, :mobile_number)
    end

    # Confirms the correct customer.
    def correct_customer
        @customer = Customer.find(params[:id])
        redirect_to(root_url) unless (current_user?(@customer) || current_user.admin?)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless (current_user?(@customer) || current_user.admin?)
    end

end
