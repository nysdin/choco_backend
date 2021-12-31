RSpec.describe Favorite, type: :request do
  include GraphqlQueries

  describe 'favorite query' do
    context 'ユーザーのログインが有効のとき' do
      let(:user) { create(:user) }
      let(:merchandise_id) { create(:merchandise).id }
      let!(:favorite) { create(:favorite, user_id: user.id, merchandise_id: merchandise_id) }

      it '正しいfavoriteのidが返ってくること' do
        data = ChocoSchema.execute(
          favorite_query(merchandise_id),
          context: {
            current_user: user
          }
        )

        expect(data.to_h['data']['favorite']['id'].to_i).to eq(favorite.id)
      end
    end
  end

  context 'ユーザーのログインが有効ではないときに' do
    let(:merchandise_id) { create(:merchandise).id }

    it 'リクエストのエラーが発生すること' do
      data = ChocoSchema.execute(
        favorite_query(merchandise_id),
        context: {
          current_user: nil
        }
      )

      expect(data.to_h['errors'][0]['message']).to eq('ログインが見当たりません。')
    end
  end
end
