require 'rails_helper'

describe Contact do
  it 'is valid with firstname, lastname and email' do
    contact = Contact.create(firstname: 'Adam', lastname: "Januszowski", email: 'yey@g.com')

    expect(contact).to be_valid  
  end
  
  it 'is invalid without firstname' do
    #setup
    contact = Contact.create(firstname: nil)
    #association
    contact.valid?
    #exec
    expect(contact.errors[:firstname]).to include("can't be blank")
  end
  
  it 'is invalid without lastname' do
    contact = Contact.create(firstname: nil)
    
    contact.valid?
    
    expect(contact.errors[:lastname]).to include("can't be blank")
  end

  it 'is invalid without email' do
    contact = Contact.create(email: nil)

    contact.valid?

    expect(contact.errors[:email]).to include("can't be blank")
  end  

  it 'is invalid with a duplicate email address' do
    Contact.create(firstname: 'Joe', lastname: 'Pesco', email: 'janusz@gmail.com')
    contact = Contact.create(firstname: 'Hxc', lastname: 'Ps', email: 'janusz@gmail.com')

    contact.valid?

    expect(contact.errors[:email]).to include('has already been taken')
  end

  it 'returns a contact full name as a string' do
    contact = Contact.create(firstname: "Bogdan", lastname: "Powstaniec", email: "kpo@sa.com")
    
    expect(contact.name).to eq 'Bogdan Powstaniec'
  end
  
end
