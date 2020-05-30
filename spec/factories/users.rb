FactoryBot.define do

  factory :user do
    name                  {"hoge"}
    image                 {"hoge.png"}
    email                 {"hoge@hoge.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

end