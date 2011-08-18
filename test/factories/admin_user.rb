Factory.define :admin_user, :class => AdminUser do |p|
  p.email                 { Faker::Internet.email }
end
