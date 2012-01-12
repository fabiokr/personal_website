FactoryGirl.define do
  factory :blog_article, :class => Blog::Article do
    title         { Faker::Lorem.sentence }
    excerpt       { Faker::Lorem.sentences.join(' ') }
    body          { Faker::Lorem.paragraphs.join(' ') }
    published_at  { rand > 0.5 ? DateTime.now + rand : nil }
    locale        { ManageableContent::Engine.config.locales.sample.to_s }
  end
end