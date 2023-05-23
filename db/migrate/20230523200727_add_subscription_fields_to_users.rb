class AddSubscriptionFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :stripe_subscription_id, :string
    add_column :users, :subscription_status, :string
  end
end
