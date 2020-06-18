FactoryBot.define do
  factory :relationship do
    user
    follow { user }
  end
end