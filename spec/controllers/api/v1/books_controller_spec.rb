require 'rails_helper'

describe Api::V1::BooksController do
  include_context 'Authenticated User'
  include_context 'Response Body'

  describe 'GET #index' do
    context 'When fetching all the books' do
      let!(:books) { create_list(:book, 3) }

      before do
        get :index
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end

      it 'responses with all books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(parsed_response_body.to_json) =~ JSON.parse(expected)
      end
    end
  end
  describe 'GET #show' do
    context 'When fetching a user rent' do
      let!(:books) { create_list(:book, 3) }

      before do
        get :show, params: { id: books[0].id }
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end

      it 'responses with id books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: FullBookSerializer
        ).to_json
        expect(parsed_response_body.to_json) =~ JSON.parse(expected)
      end
    end
  end
end
