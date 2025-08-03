FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "Tarea #{n}" }
    description { "Descripción de la tarea" }
    status { "pending" }
    due_date { Date.current + 7.days }
    association :project
    created_at { Time.now }
    association :assigned_to, factory: :user
    association :created_by, factory: :user
  end
end