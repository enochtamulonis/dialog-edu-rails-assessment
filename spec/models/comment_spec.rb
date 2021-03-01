require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is a valid comment with valid attributes' do
    comment = Comment.new(article_id: nil, body: nil)
    expect(comment).to_not be_valid
  end
  it 'is not valid without a body' do
    comment = Comment.new(article_id: 5, body: nil)
    expect(comment).to_not be_valid
  end

  it 'is not valid without an article id' do
    comment = Comment.new(body: "valid body")
    expect(comment).to_not be_valid
  end

end
