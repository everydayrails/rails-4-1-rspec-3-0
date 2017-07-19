FactoryGirl.define do
 factory :contact do
    firstname 'John'
    lastname 'Doe'
    sequence(:email) {|n| "johndoe#{n}@example.com" }
  end
end
