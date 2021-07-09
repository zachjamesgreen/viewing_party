FactoryBot.define do
  factory :user do
    username { Faker::Name.unique.first_name }
    email  { "#{username}@example.com" }
    password { username }
  end
end