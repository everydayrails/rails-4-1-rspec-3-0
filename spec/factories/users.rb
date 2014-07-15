require 'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'secret'
    password_confirmation { password }

    factory :admin do
      admin true
    end
  end
end
