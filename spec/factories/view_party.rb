FactoryBot.define do
  factory :view_party do
    movie_id { rand(0..11)}
    event_time { Faker::Time.between(from: Time.now, to: Time.now + 31)}
    duration {rand(60..181)}
    movie_title { Faker::Movie.title }
  end
end