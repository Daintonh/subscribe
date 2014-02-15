module Subscribe
  class Account < ActiveRecord::Base
    belongs_to :owner, :class_name => "Subscribe::User"
    accepts_nested_attributes_for :owner
  end
end
