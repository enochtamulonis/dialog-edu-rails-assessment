RSpec.describe "/comments", type: :request do

  describe 'Get /index' do
    it 'renders a successful response' do
      get comments_path
      expect(response).to be_successful
    end
  end

  describe 'Get /comments/id' do
    it 'renders a successful response' do
      article = Article.create!(title: "Valid title", body: "Valid body")
      comment = article.comments.create!(body: "Nice comment")
      get comment_path(comment)
      expect(response).to be_successful
    end
  end

end
