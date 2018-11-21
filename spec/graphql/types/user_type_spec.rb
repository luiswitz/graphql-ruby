require 'rails_helper'

RSpec.describe Types::UserType do
  subject { described_class }

  specify 'the correct name' do
    expect(subject.name).to eq('User')
  end

  specify 'the correct fields' do
    expected_fields = {
      id: 'ID!',
      name: 'String!',
      email: 'String!'
    }

    expect(subject.fields).to match_fields(expected_fields)
  end
end
