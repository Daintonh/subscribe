module Subscribe
  class Member < ActiveRecord::Base
    belongs_to :account, :class_name => "Subscribe::Account"
    belongs_to :user, :class_name => "Subscribe::User"
  end
end
