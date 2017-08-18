require 'rails_helper'

describe Api::V1::RentsController do
  include_context 'Authenticated User'
  include Response::JSONParser

  describe 'POST #create' do
    context 'When create a new rent' do
      let!(:books) { create_list(:book, 3) }
      let!(:book) { books.first }

      before do
        post :create, params: { id: user.id, rent: { book_id: book.id, from: Time.now, to: Time.now + 1.day  } }
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:created)
      end
    end
  end
end
