require 'rails_helper'

RSpec.describe Resolvers::CreateArticle do
  subject { described_class.new }

  let(:obj) { nil }
  let(:ctx) { {} }
  let(:args) do
    {
      title: 'the-title',
      body: 'the-body'
    }
  end

  let(:call) { subject.call(obj, args, ctx)  }

  describe '#call' do
    it 'persists the article' do
      result = call

      expect(result.title).to eq('the-title')
      expect(result.body).to eq('the-body')
    end
  end
end
