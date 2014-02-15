require_dependency "subscribe/application_controller"
module Subscribe
  class AccountsController < ApplicationController
    def new
      @account = Subscribe::Account.new
      @account.build_owner
    end

    def create
      @account = Subscribe::Account.create(account_params)
      env["warden"].set_user(@account.owner, :scope => :user)
      env["warden"].set_user(@account, :scope => :account)
      flash[:succes] = "Your account has been successfully created."
      redirect_to subscribe.root_url
    end

    private
    def account_params
      params.require(:account).permit(:name, :subdomain, {:owner_attributes => [:email, :password, :password_confirmation]})
    end
  end
end
