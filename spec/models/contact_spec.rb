require 'rails_helper'

describe Contact do
  # 有効なファクトリを持つこと
  it 'has a valid factory' do
    expect(build(:contact)).to be_valid
  end

  # 姓と名とメールがあれば有効な状態であること
  it 'is valid with a firstname, lastname and email' do
   contact = Contact.new(
      firstname: 'Aaron',
      lastname: 'Sumner',
      email: 'tester@example.com'
    )
    expect(contact).to be_valid
  end
  # 名がなければ無効な状態であること
  it 'is invalid without a firstname' do
    contact = build(:contact, lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).to include('can\'t be blank')
  end

  # 重複したメールアドレスなら無効な状態であること
  it 'is invalid without a duplicate email address' do
    create(
      :contact,
      lastname: 'Tester',
      email: 'johndoe1@example.com'
    )
    contact = build(
      :contact,
      lastname: 'Tester',
      email: 'johndoe1@example.com'
    )
    contact.valid?
    expect(contact.errors[:email]).to include('has already been taken')
  end

  # 連絡先のフルネームを文字列として返すこと
  it 'returns a contact’s full name as a string' do
    contact = build(:contact)
    expect(contact.name).to eq 'John Doe'
  end

  describe 'filter last name by letter' do
    before do
      @smith = build(
        :contact,
        lastname: 'Smith',
        email: 'jsmith@example.com'
      )
      @jones = build(
        :contact,
        firstname: 'Tim',
        lastname: 'Jones',
        email: 'tjones@example.com'
      )
      @johnson = build(
        :contact,
        lastname: 'Johnson',
        email: 'jjohnson@example.com'
      )
    end

    context 'matching letters' do
      # マッチした結果をソート済みの配列として返すこと
      # use fixture path
      xit 'returns a sorted array of results that match' do
        expect(Contact.by_letter('J')).to eq [@johnson, @jones]
      end
    end

    context 'non-matching letters' do
      # マッチしなかったものは結果に含まれないこと
      it 'omits results that do not match' do
        expect(Contact.by_letter('J')).not_to include @smith
      end
    end
  end
end
