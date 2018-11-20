require 'rails_helper'

RSpec.describe Types::QueryType do
  subject { described_class }

  specify 'the correct name' do
    expect(subject.name).to eq('Query')
  end

  specify 'the correct fields' do
    expected_fields = {
      allArticles: '[article]!'
    }

    expect(subject.fields).to match_fields(expected_fields)
  end
end
