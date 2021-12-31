RSpec.describe Favorite, type: :request do
  include GraphqlQueries

  describe 'favorite mutation' do
    context 'ユーザーのログインが有効のとき' do
      let(:user) { create(:user) }
      let(:merchandise_id) { create(:merchandise).id }
      let(:favorite) { create(:favorite, user_id: user.id, merchandise_id: merchandise_id) }

      it 'いいねを作成できていること(user_id & merchandise_idの組み合わせで判断)' do
        data = ChocoSchema.execute(
          favorite_mutation(merchandise_id: merchandise_id, is_favorite: true),
          context: {
            current_user: user
          }
        )

        created_favorite = data.to_h['data']['favorite']['favorite']
        created_favorite_user_merchandise_id = [created_favorite['user']['id'].to_i, created_favorite['merchandise']['id'].to_i]

        expect(created_favorite_user_merchandise_id).to eq([user.id, merchandise_id])
      end

      it '既存のいいねを取り消せること' do
        # => favoriteを一度呼び出さないとfavoriteは作成されない(消しちゃだめ！)
        Rails.logger.info "取り消すいいねのレコード -> #{favorite}"

        data = ChocoSchema.execute(
          favorite_mutation(merchandise_id: merchandise_id, is_favorite: false),
          context: {
            current_user: user
          }
        )

        created_favorite = data.to_h['data']['favorite']['favorite']
        created_favorite_user_merchandise_id = [created_favorite['user']['id'].to_i, created_favorite['merchandise']['id'].to_i]

        expect(created_favorite_user_merchandise_id).to eq([user.id, merchandise_id])
      end
    end

    context 'いいねが有効ではないとき' do
      let(:merchandise_id) { create(:merchandise).id }

      it '正しいエラーメッセージが返ってくること' do
        data = ChocoSchema.execute(
          favorite_mutation(merchandise_id: merchandise_id, is_favorite: true),
          context: {
            current_user: nil
          }
        )
        error_message = data.to_h['errors'][0]['message']

        expect(error_message).to eq('ログインが見当たりません。')
      end

    end
  end
end
