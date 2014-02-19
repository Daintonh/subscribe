require_dependency "subscribe/application_controller"

module Subscribe
  class Account::DashboardController < ApplicationController
    before_filter :authenticate_user!

    def index

    end
  end
end
