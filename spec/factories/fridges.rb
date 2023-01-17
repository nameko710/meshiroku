FactoryBot.define do
  factory :fridge do
    availability   {"true"}
    food           {Faker::Name.initials(number: 2)}
    amount         {Faker::Number.between(from: 1, to: 100)}
    unit           {Faker::Name.initials(number: 2)}
    price          {Faker::Number.between(from: 1, to: 1000)}
    association :user
  end
end
