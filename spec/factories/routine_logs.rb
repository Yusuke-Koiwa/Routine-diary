FactoryBot.define do
  factory :routine_log do
    task
    content           { "hogehogehogehogehoge" }
    date              { Date.new(2020, 05, 30) }
    category
  end
end