RSpec.describe Merchandise, type: :request do
  include GraphqlQueries
  include Authorization

  describe "merchandise detail" do
    let(:merchandise) {
      merchandise = create(:merchandise)
      divided_department = create(:divided_department, merchandise_id: merchandise.id)
      merchandise
    }

    context 'idで指定した商品（merchandise）のデータが取得できる' do
      it '' do
        return_value = ChocoSchema.execute(
          merchandise_detail_query(id: merchandise.id),
          context:{
            current_user: user_for_graphiql
          }
        )

        data = return_value.to_h['data']['merchandiseDetail']
        expect(data['title']).to eq(merchandise.title)
      end
    end
  end
end
