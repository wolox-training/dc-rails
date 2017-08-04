FactoryGirl.define do
  factory :book do
    genere Faker::Book.genre
    author Faker::Book.author
    image Faker::Internet.url
    title Faker::Book.title
    publisher Faker::Book.publisher
    year Faker::Date.backward(14)
  end
end
