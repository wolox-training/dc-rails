require 'rails_helper'

describe Api::V1::BookSuggestionsController do
  include_context 'Authenticated User'
  include Response::JSONParser

  describe 'GET #index' do
    context 'When fetching all the suggestions' do
      let!(:suggestion) { create_list(:book_suggestion, 3) }

      before do
        get :index
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end

      it 'responses with all suggestions json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          suggestion, each_serializer: BookSuggestionSerializer
        ).to_json
        expect(parsed_response_body.to_json) =~ JSON.parse(expected)
      end
    end
  end

  describe 'GET #show' do
    context 'When fetching a suggestion' do
      let!(:suggestions) { create_list(:book_suggestion, 3, user_id: user.id) }
      let(:suggest) { suggestions.first }

      before do
        get :show, params: { id: suggest.id }
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end

      it 'responses with id suggestion json' do
        expected = ActiveModel::Serializer.new(
          suggest, serializer: BookSuggestionSerializer
        ).to_json
        expect(parsed_response_body.to_json) =~ JSON.parse(expected)
      end
    end
  end
end
