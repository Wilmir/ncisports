class IssuesController < ApplicationController
    before_action :logged_in_customer, only: [:create, :destroy]
    
    def index
        @issues = Issue.where(status: "New").paginate(page: params[:page], per_page: 10)
    end

    def create
        @issue = current_user.issues.build(issue_params)
        @issue.status = "New"
        if @issue.save
            flash[:success] = "New issue has been submitted!"
            redirect_to current_user
        else
            @customer = current_user
            @issues = @customer.issues.paginate(page: params[:page], per_page: 10)
            render 'customers/show'
        end
    end

    def destroy
    end

    private
        def issue_params
            params.require(:issue).permit(:issue_type, :title, :description)
        end
end
