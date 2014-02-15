require 'spec_helper'

module Subscribe
  describe DashboardController do

    describe "GET 'incex'" do
      it "returns http success" do
        get 'incex'
        response.should be_success
      end
    end

  end
end
