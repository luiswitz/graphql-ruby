require 'rails_helper'

RSpec.describe Types::MutationType do
  subject { described_class }

  specify 'the correct name' do
    expect(subject.name).to eq('Mutation')
  end

  specify 'the corect fields' do
    expected_fields = {
      createLink: 'article'
    }

    expect(subject.fields).to match_fields(expected_fields)
  end
end
