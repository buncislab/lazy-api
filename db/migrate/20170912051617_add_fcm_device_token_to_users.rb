class AddFcmDeviceTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fcm_device_token, :string
  end
end
