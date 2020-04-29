class IssuesController < ApplicationController
    before_action :logged_in_customer, only: [:create, :destroy]
    before_action :correct_user,   only: [:edit, :update, :destroy]
    
    def index
        @issues = Issue.where(status: "New").paginate(page: params[:page], per_page: 10)
    end

    def show
        @issue = Issue.find_by(id: params[:id])
    end

    def edit
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

    def update
        if @issue.update(issue_params)
            flash[:success] = "Case has been updated"
            redirect_to @issue
        else
            render 'edit'
        end
    end

    def destroy
        @issue.destroy
        flash[:success] = "Case deleted"
        redirect_to @issue.customer || current_user
    end

    private
        def issue_params
            params.require(:issue).permit(:issue_type, :title, :description, :status)
        end

        #Only admins and owner can delete a case
        def correct_user
            if (current_user.admin)
                @issue = Issue.find_by(id: params[:id])
            else
                @issue = current_user.issues.find_by(id: params[:id])
            end
            redirect_to current_user if @issue.nil?
        end

end
