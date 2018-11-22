require 'rails_helper'

RSpec.describe User, type: :model do
  subject do 
    described_class.new(
      name: 'the-name',
      email: 'the@mail.com',
      password: 'the-super-secure-password'
    )
  end

  describe 'validations' do
    it 'is invalid without a name' do
      subject.name = ''

      expect(subject).to_not be_valid
    end

    it 'is invalid without an email' do
      subject.email = ''

      expect(subject).to_not be_valid
    end

    it 'is invalid without a password' do
      subject.password = nil

      expect(subject).to_not be_valid
    end

    it 'is not valid with a password less than 8 characters' do
      subject.password = 'abc'

      expect(subject).to_not be_valid
    end

    it 'is invalid with a duplicated email' do
      subject.save

      user = User.create(
        name: 'the-name',
        email: 'the@mail.com',
        password: 'my-password'
      )

      expect(user).to_not be_valid
    end
  end
end
