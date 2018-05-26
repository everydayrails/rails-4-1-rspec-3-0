require 'rails_helper'

describe Contact do

  # 姓と名とメールがあれば有効な状態であること
  it "is valid with a firstname, latsname and email" do
    contact = Contact.new(
      firstname: 'Aaron',
      lastname: 'Sumner',
      email: 'tester@example.com'
    )
    expect(contact).to be_valid
  end

  # 名がなければ無効な状態であること
  it "is invalid without a firstname" do
    contact = Contact.new(firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).to include("can't be blank")
  end

  # 姓がなければ無効な状態であること
  it "is invalid without a lastname" do
    contact = Contact.new(lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end

  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    contact = Contact.new(email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplivate email address" do
    Contact.create(
      firstname: 'Joe',
      lastname: 'Tester',
      email: 'tester@example.com'
    )
    contact = Contact.new(
      firstname: 'Jane',
      lastname: 'Tester',
      email: 'tester@example.com'
    )

    contact.valid?
    expect(contact.errors[:email]).to include("has already been taken")
  end

  # 連絡先のフルネームを文字列として返すこと
  it "returns a contact's full name as a string" do
    contact = Contact.new(firstname: 'John', lastname: 'Doe', email: 'johndone@example.com')
    expect(contact.name).to eq 'John Doe'
  end

  # 文字で姓をフィルタする
  describe "filter last name by letter" do
    before :each do
      @smith = Contact.create(
        firstname: 'John',
        lastname: 'Smith',
        email: 'jsmith@example.com'
      )
      @jones = Contact.create(
        firstname: 'Tim',
        lastname: 'Jones',
        email: 'tjones@example.com'
      )
      @johnson = Contact.create(
        firstname: 'John',
        lastname: 'Johnson',
        email: 'jjohnson@example.com'
      )
    end
    # マッチする文字列の場合
    context "matching letters" do
      it "returns a sorted array of results that match" do
        expect(Contact.by_letter("J")).to eq [@johnson, @jones]
      end
    end

    # マッチしない文字の場合
    context "non-matching letters" do
    end
  end

  # マッチしなかったものは結果に含まれないこと
  it "omits results that do not match" do
    smith = Contact.create(
      firstname: 'John',
      lastname: 'Smith',
      email: 'jsmith@example.com'
    )
    jones = Contact.create(
      firstname: 'Tim',
      lastname: 'Jones',
      email: 'tjones@example.com'
    )
    johnson = Contact.create(
      firstname: 'John',
      lastname: 'Johnson',
      email: 'jjohnson@example.com'
    )
    expect(Contact.by_letter("J")).not_to include smith
  end
end
