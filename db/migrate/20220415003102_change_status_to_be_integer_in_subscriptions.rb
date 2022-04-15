class ChangeStatusToBeIntegerInSubscriptions < ActiveRecord::Migration[7.0]
  def change
    change_column :subscriptions, :status, "integer USING CAST(status AS integer)"
  end
end
