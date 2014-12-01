require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(name: 'User', email: 'user@user.com', display_name: 'user',
             password: 'password', password_confirmation: 'password')
  end

  it 'is valid' do
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is valid without a display name' do
    user.display_name = nil
    expect(user).to be_valid
  end

  it 'is invalid if optional display name is too short' do
    user.display_name = 'A'
    expect(user).to_not be_valid
  end

  it 'is invalid if optional display name is too long' do
    user.display_name = ('A' * 33)
    expect(user).to_not be_valid
  end

  it 'is invalid without an email address' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without a valid email address' do
    addresses = %w(user@foo,com user_at_foo.org example.user@foo.
                   foo@bar_baz.com foo@bar_baz.com)
    addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user).to_not be_valid
    end
  end

  it 'is invalid if the email is not unique' do
    user.save
    invalid_user = user.dup
    invalid_user.email = user.email.upcase
    expect(invalid_user.save).to be false
  end

  it 'is invalid if password is not present' do
    user.password = user.password_confirmation = ''
    expect(user).to_not be_valid
  end

  it 'is invalid if password is too short' do
    user.password = user.password_confirmation = 'a' * 5
    expect(user).to_not be_valid
  end
  it 'is invalid if password does not match confirmation' do
    user.password = 'foobar'
    expect(user).to_not be_valid
  end

  it 'is not an admin by default' do
    expect(user.admin).to be false
  end

  it 'responds to #is_admin?' do
    expect(user).to respond_to(:is_admin?)
  end

  it 'can make a user an admin' do
    user.admin = true
    expect(user.is_admin?).to be true
  end
end
