FactoryGirl.define do
  factory :page, :class => ManageableContent::Page do
    controller_path { Faker::Lorem.words.join(', ') }
    title           { Faker::Lorem.sentence }
    description     { Faker::Lorem.sentence }
    keywords        { Faker::Lorem.words.join(', ') }
    locale          { I18n.locale }
  end
end