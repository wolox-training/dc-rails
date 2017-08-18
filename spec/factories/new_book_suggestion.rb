FactoryGirl.define do
  factory :book_suggestion do
    user { create(:user) }
    author { Faker::Book.author }
    link { Faker::Internet.url }
    title { Faker::Book.title }
    publisher { Faker::Book.publisher }
    editorial { Faker::Book.publisher }
    price { Faker::Book.publisher }
    year { Faker::Date.backward(14).year }
  end
end
