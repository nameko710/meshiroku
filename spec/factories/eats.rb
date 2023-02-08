FactoryBot.define do
  factory :eat do
    title             {Faker::Name.initials(number: 2)}
    price             {Faker::Number.between(from: 1, to: 1000)}
    comment           {Faker::Name.initials(number: 2)}
    date              {Faker::Date.between(from: 2.days.ago, to: Date.today)}
    association :user

    after(:build) do |eat|
      eat.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.png')
    end
  end
end
