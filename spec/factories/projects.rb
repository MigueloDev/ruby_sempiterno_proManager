FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Proyecto #{n}" }
    description { "Descripción del proyecto" }
    status { "active" }
    start_date { Date.current }
    due_date { Date.current + 30.days }
  end
end