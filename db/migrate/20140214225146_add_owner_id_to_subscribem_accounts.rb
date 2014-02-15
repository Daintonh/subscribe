class AddOwnerIdToSubscribemAccounts < ActiveRecord::Migration
  def change
    add_column :subscribe_accounts, :owner_id, :integer
  end
end
