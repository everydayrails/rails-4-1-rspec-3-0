require 'rails_helper'

describe Contact do
  it 'is valid with firstname, lastname and email'
  it 'is invalid without firstname'
  it 'is invalid without lastname'
  it 'is invalid without email'
  it 'is invalid with a duplicate email address'
  it 'returns a contact full name as a string'
end
