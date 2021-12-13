require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /users' do
    context '不正なJWTトークンが渡された場合' do
      before { post '/users?token=cjknsdjvhdsvjefhoviehve' }

      it '不正なトークンとして認識される' do
        json = JSON.parse(response.body)
        expect(json['error']).to eq('不正なトークンです。')
      end

      it 'スタータスコード401が返される' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
