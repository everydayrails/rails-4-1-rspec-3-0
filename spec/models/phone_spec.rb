require 'rails_helper'

describe Phone do
  # 連絡先ごとに重複した電話番号を許可しないこと
  it 'does not allow duplicate phone numbers per contact' do
    contact = create(:contact)
    create(
      :home_phone,
      contact: contact,
      phone: '785-555-1234'
    )
    mobile_phone = contact.phones.build(
      phone_type: 'mobile',
      phone: '785-555-1234'
    )
    mobile_phone.valid?
    expect(mobile_phone.errors[:phone]).to include('has already been taken')
  end

  # 2 件の連絡先で同じ電話番号を共有できること
  it 'allows two contacts to share a phone number' do
    create(
      :home_phone,
      phone: '785-555-1234'
    )
    mobile_phone = build(
      :mobile_phone,
      phone: '785-555-1234'
    )
    expect(mobile_phone).to be_valid
  end
end
