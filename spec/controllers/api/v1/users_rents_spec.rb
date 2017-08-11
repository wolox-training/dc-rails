require 'rails_helper'

describe Api::V1::UsersController do
  include_context 'Authenticated User'
  include Response::JSONParser

  describe 'GET #rents_index' do
    context 'When get all 26 user rents' do
      let!(:user_rents) { create_list(:rent, 26, user_id: user.id)}

      before do
        get :rents_index, params: { id: user.id }
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end

      it 'responses with 25 user rents per page' do
        expect(parsed_response_body['count']).to eq(25)
      end

      it 'responses with 2 pages' do
        expect(parsed_response_body['total_pages']).to eq(2)
      end
    end
  end
end
