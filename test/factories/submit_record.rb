FactoryBot.define do
  factory :submit_record do
    user
    problem

    status { %w[AC WA TLE MLE RTE RE CE].sample }

    execution_time { Faker::Number.between(from: 5, to: 1500) }
    memory_used { Faker::Number.between(from: 1024, to: 262144) }
    submission_id { Faker::Number.unique.number(digits: 8) }
    submitted_at { Faker::Time.backward(days: 30) }
  end
end
