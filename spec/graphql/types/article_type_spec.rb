require 'rails_helper'

RSpec.describe Types::ArticleType do
  subject { described_class }

  specify 'the correct name' do
    expect(subject.name).to eq('article')
  end

  specify 'the correct fields' do
    expected_fields = {
      id: 'ID!',
      title: 'String!',
      body: 'String!'
    }

    expect(subject.fields).to match_fields(expected_fields)
  end
end
