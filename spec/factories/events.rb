FactoryBot.define do
  factory :event do
    title { 'ใในใ' }
    start_time { Time.zone.now + 9 }
    end_time { Time.zone.tomorrow }
    association :user
    association :department
  end
end
