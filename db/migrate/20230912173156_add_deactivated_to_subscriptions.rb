class AddDeactivatedToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :deactivated, :boolean
  end
end
