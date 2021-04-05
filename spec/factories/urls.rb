FactoryBot.define do
  factory :url do
    long_url { "MyText" }
    short_url { "MyString" }
    click { 1 }
    user { nil }
  end
end
