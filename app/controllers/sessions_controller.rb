class SessionsController < ApplicationController
  def new
  end

  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)
    if(customer && customer.authenticate(params[:session][:password]))
      log_in customer
      remember customer
      redirect_to customer
    else 
      #Create an error messag
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
