FactoryBot.define do
  factory :user do
    username { Faker::Internet.unique.username(specifier: 5..10) }
    email { Faker::Internet.unique.email }
    atcoder_handle { Faker::Internet.unique.username(specifier: 5..10) }

    password { "password123" }
    password_confirmation { "password123" }
  end
end
