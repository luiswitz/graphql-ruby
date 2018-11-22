require 'rails_helper'

RSpec.describe Resolvers::CreateUser do
  subject { described_class.new }

  let(:obj) { nil }
  let(:ctx) { nil }

  let(:auth_provider) do
    {
      user_data: {
        email: 'the-email',
        password: 'the-password'
      }
    }
  end

  let(:args) do
    {
      name: 'the-name',
      authProvider: auth_provider
    }
  end

  let(:call) do
    subject.call(obj, args, ctx)
  end

  describe '#call' do
    it 'sign up an user' do
      user = call

      expect(user.name).to eq('the-name')
      expect(user.email).to eq('the-email')
    end
  end
end
