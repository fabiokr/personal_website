FactoryGirl.define do
  factory :page_content, :class => ManageableContent::PageContent do
    association :page
    key         'body'
    content     { Faker::Lorem.paragraphs.join(' ') }
  end
end