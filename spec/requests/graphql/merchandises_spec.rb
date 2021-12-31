RSpec.describe Merchandise, type: :request do
  include GraphqlQueries

  describe 'merchandises' do
    before { create_list(:merchandise, 20) }

    let(:login_user) { create(:user) }

    context '正しくページネーションのページを取得' do
      before { post '/graphql', params: { query: listed_merchandises_query } }

      it 'merchandisesの最初の10件が返ってくることが返ってくること' do
        json = JSON.parse(response.body)
        data = json['data']['merchandises']['edges']
        expect(data.size).to eq(10)
      end

      it '次の10件のデータが取得できること' do
        json = JSON.parse(response.body)
        end_cursor = json['data']['merchandises']['pageInfo']['endCursor']

        data = ChocoSchema.execute(
          listed_merchandises_query(end_cursor),
          context: {
            current_user: login_user
          }
        )
        data = data.to_h['data']['merchandises']['edges']

        expect(data.size).to eq(10)
      end
    end
  end
end
