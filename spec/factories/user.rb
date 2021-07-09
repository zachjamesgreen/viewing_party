FactoryBot.define do
  factory :user do
    name = Faker::Name.first_name
    username { name }
    email  { "#{name}@example.com" }
    password { name }
  end
end