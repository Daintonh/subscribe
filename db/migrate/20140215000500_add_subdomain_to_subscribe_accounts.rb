class AddSubdomainToSubscribeAccounts < ActiveRecord::Migration
  def change
    add_column :subscribe_accounts, :subdomain, :string
    add_index  :subscribe_accounts, :subdomain
  end
end
