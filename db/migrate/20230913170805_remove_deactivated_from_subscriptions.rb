class RemoveDeactivatedFromSubscriptions < ActiveRecord::Migration[5.2]
  def change
    remove_column :subscriptions, :deactivated, :boolean
  end
end
