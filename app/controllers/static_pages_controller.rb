class StaticPagesController < ApplicationController
  def home
    @issue = current_user.issues.build if logged_in?
  end

  def about
  
  end
end
