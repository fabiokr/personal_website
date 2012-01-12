FactoryGirl.define do
  factory :admin_user, :class => AdminUser do
    email { Faker::Internet.email }
  end
end