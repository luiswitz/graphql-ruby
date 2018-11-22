require 'rails_helper'

RSpec.describe Types::AuthProviderEmailInput do
  subject { described_class }

  specify 'the correct name' do
    expect(subject.name).to eq('AUTH_PROVIDER_EMAIL_INPUT')
  end

  specify 'the correct fields' do
    expected_fields = {
      email: 'String!',
      password: 'String!'
    }

    expect(subject.arguments).to match_fields(expected_fields)
  end
end
