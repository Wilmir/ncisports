class ApplicationController < ActionController::Base
    include SessionsHelper
    def hello
        render html: "hello, world!"
    end

    # Checks if customer is logged in
    def logged_in_customer
        unless logged_in?
          store_location
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
    end
end
