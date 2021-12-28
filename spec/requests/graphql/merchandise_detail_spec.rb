RSpec.describe Merchandise, type: :request do
  include GraphqlQueries
  include Authorization

  describe "merchandise detail" do
    # let(:merchandise) { create(:merchandise) }
    # let(:divided_department) { create(:divided_department, merchandise_id: merchandise.id) }

    # context '正しい値が取得できる' do
    #   it '' do
    #     pp divided_department
    #     return_value = ChocoSchema.execute(
    #       merchandise_detail_query(id: merchandise.id),
    #       context:{
    #         current_user: user_for_graphiql
    #       }
    #     )

    #     pp data = return_value.to_h#['data']['merchandiseDetail']
    #   end
    # end
  end
end
