class StaticPagesController < ApplicationController
  def home
    @customer = Customer.new if !logged_in?
    @issue = current_user.issues.build if logged_in?
  end

  def about
  
  end
end
