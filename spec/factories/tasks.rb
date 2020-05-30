FactoryBot.define do

  factory :task do
    user
    score             {"done"}
    body              {"hogehogehogehogehoge"}
    date              {Date.new(2020, 05, 30)}
    start_time        {Date.new(2000, 05, 30)}
  end

end