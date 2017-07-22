FactoryGirl.define do
  factory :contact do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }

    trait :three_phones do
      after(:build) do |contact|
        [:home_phone, :work_phone, :mobile_phone].each do |phone|
          # has_many の属性はcollectionとして表現されている
          contact.phones << FactoryGirl.build(
            :phone,
            phone_type: phone,
            contact: contact
          )
        end
      end
    end
  end
end
