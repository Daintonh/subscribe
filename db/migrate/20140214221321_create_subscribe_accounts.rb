class CreateSubscribeAccounts < ActiveRecord::Migration
  def change
    create_table :subscribe_accounts do |t|
      t.string :name

      t.timestamps
    end
  end
end
