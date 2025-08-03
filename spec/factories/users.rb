FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Usuario #{n}" }
    sequence(:email) { |n| "usuario#{n}@ejemplo.com" }
    password { "password123" }
    password_confirmation { "password123" }
  end
end