FactoryBot.define do
  factory :comment do
    text {Faker::Lorem.sentence}
    association :user
    association :department

    after(:build) do |comment|
      comment.image.attach(io: File.open('public/images/test_image.png'), filename: "test_image.png")
    end
  end
end
