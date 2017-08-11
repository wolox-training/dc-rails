FactoryGirl.define do
  factory :rent do
    user { create(:user) }
    book { create(:book) }
    from { Faker::Date.backward(1) }
    to { Faker::Date.forward(5) }
  end
end
