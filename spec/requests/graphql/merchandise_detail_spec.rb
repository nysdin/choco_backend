RSpec.describe Merchandise, type: :request do
  include GraphqlQueries

  describe 'merchandise detail' do
    let(:merchandise) {
      merchandise = create(:merchandise)
      create(:divided_department, merchandise_id: merchandise.id)
      merchandise
    }
    let(:login_user) { create(:user) }

    context '正しいidで指定したとき' do
      it '正しい商品（merchandise）のデータが取得できる' do
        data = ChocoSchema.execute(
          merchandise_detail_query(id: merchandise.id),
          context: {
            current_user: login_user
          }
        )

        data = data.to_h['data']['merchandiseDetail']
        expect(data['title']).to eq(merchandise.title)
      end
    end

    context '不正なidで指定したとき' do
      it 'エラーが発生していること' do
        data = ChocoSchema.execute(
          merchandise_detail_query(id: 100_000_000_000_000_000),
          context: {
            current_user: login_user
          }
        )

        is_error_exists = data.to_h.key?('errors')
        expect(is_error_exists).to eq(true)
      end
    end
  end
end
