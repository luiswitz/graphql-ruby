require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it 'is not valid without a title' do
      article = Article.new(title: '', body: 'the-body') 

      expect(article).to_not be_valid
    end


    it 'is not valid without a body' do
      article = Article.new(title: 'the-title', body: '') 

      expect(article).to_not be_valid
    end
  end
end
