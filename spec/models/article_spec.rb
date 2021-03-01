require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'is a valid article with valid attributes' do
    article = Article.new(title: nil, body: nil)
    expect(article).to_not be_valid
  end
  it 'is not valid without a title' do
    article = Article.new(title: nil, body: "a valid body")
    expect(article).to_not be_valid
  end

  it 'is not valid without a body' do
    article = Article.new(title: "a valid title", body: nil)
    expect(article).to_not be_valid
  end

  it 'has a title with atleast 10 characters' do
    article = Article.new(title: "title of more than ten characters", body: "A valid body")
    expect(article).to be_valid
  end

end
