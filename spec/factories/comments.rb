FactoryBot.define do
  factory :comment do
    user
    task
    content {"hogehogehogehogehoge"}
  end
end