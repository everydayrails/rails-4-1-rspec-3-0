FactoryGirl.define do
  factory :phone do
    # one_has_many のoneを関連付ける
    # contact { create(:contact) } と同じ
    association :contact
    phone { Faker::PhoneNumber.phone_number }

    factory :home_phone do
      phone_type 'home'
    end

    factory :work_phone do
      phone_type 'work'
    end

    factory :mobile_phone do
      phone_type 'mobile'
    end
  end
end
