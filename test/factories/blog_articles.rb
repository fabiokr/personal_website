Factory.define :blog_article, :class => Blog::Article do |f|
  f.title         { Faker::Lorem.sentence }
  f.excerpt       { Faker::Lorem.sentences.join(' ') }
  f.body          { Faker::Lorem.paragraphs.join(' ') }
  f.published_at  { rand > 0.5 ? DateTime.now + rand : nil }
end
