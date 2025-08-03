FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "Tarea #{n}" }
    description { "Descripción de la tarea" }
    status { "pending" }
    priority { 0 }
    due_date { Date.current + 7.days }
    association :project
    association :assigned_to, factory: :user
    association :created_by, factory: :user
  end
end 