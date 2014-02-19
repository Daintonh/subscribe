require_dependency "subscribe/application_controller"

module Subscribe
  class Account::UsersController < ApplicationController
    def new
      @user = Subscribe::User.new
    end

    def create
      account = Subscribe::Account.find_by_subdomain!(request.subdomain)
      user = account.users.create(user_params)
      force_authentication!(user)
      flash[:success] = "You have signed up successfully."
      redirect_to root_path
    end
    private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end
