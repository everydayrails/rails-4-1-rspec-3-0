require 'faker'

FactoryGirl.define do
  factory :news_release do
    title "Test news release"
    released_on 1.day.ago
    body { Faker::Lorem.paragraph }
  end
end
