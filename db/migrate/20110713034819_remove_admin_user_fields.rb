class RemoveAdminUserFields < ActiveRecord::Migration
  def self.up
  	remove_column :admin_users, :encrypted_password
  	remove_column :admin_users, :reset_password_token
  	remove_column :admin_users, :reset_password_sent_at
  end

  def self.down
  end
end
