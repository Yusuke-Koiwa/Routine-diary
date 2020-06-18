FactoryBot.define do
  factory :task do
    user
    score             { "done" }
    body              { "hogehogehogehogehoge" }
    date              { Faker::Date.between(from: 3.days.ago, to: Date.today - 1) }
    start_time        { Faker::Time.between_dates(from: Date.today - 3, to: Date.today - 1, period: :all) }
    created_at        { DateTime.now }
  end
end