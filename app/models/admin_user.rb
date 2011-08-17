class AdminUser < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email

  validates :email, :presence => true

  scope :sorted, (lambda do |*args|
    sort = args.first
    order(sort || 'email ASC')
  end)

  def self.find_for_google_apps(access_token)
    user = AdminUser.find_by_email(access_token['user_info']['email'])
  end
end
