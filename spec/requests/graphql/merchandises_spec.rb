  RSpec.describe Merchandise, type: :request do
    include GraphqlQueries
    include Authorization

    describe "merchandises" do
      before { create_list(:merchandise, 20) }
      context "正しくページネーションのページを取得" do
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
              current_user: user_for_graphiql,
            }
          )
          data = data.to_h['data']['merchandises']['edges']

          expect(data.size).to eq(10)
        end

        it 'status code 200が返ってくること' do
          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
