FactoryBot.define do
  factory :problem do
    atcoder_id { Faker::Lorem.unique.characters(number: 10) }
    title { Faker::Lorem.words(number: 3).join(" ").capitalize }
    author { Faker::Name.unique.name }
    url { Faker::Internet.unique.url }
    rating { Faker::Number.between(from: 0, to: 4000) }
    tried { Faker::Number.between(from: 0, to: 4000) }
    solved { Faker::Number.between(from: 0, to: tried) }
    description { Faker::Lorem.unique.paragraph }
    sample_test { [ "0_0_1", "0_0_2" ] }
    tags { [ "dp", "fft" ] }
    hints { [ "hint_0", "hint_1" ] }
    tutorial_code { Faker::Lorem.unique.paragraph }
  end
end
