RSpec.describe "/articles", type: :request do

  describe 'Get /index' do
    it 'renders a successful response' do
      get articles_path
      expect(response).to be_successful
    end

    it 'accepts a search parameter and sorts articles that include the search' do
      article = Article.create!(title: "Valid title", body: "VaLiD Bodyy")
      get articles_path(search: "val")
      expect(response.body).to include("Valid title")
    end
  end

  describe 'Get /articles/id' do
    it 'renders a successful response when there is an article with that id' do
      article = Article.create(title: "valid title", body: "Valid body")
      get article_path(article)

      expect(response).to be_successful
    end
  end

end
