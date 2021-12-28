module Resolvers
  class LoginRequiredResolver < GraphQL::Schema::Resolver
    def authorized?(_args = '')
      ## 開発環境でgraphiqlを使用した場合、またはテスト環境では、仮のユーザーを返す
      exception_condition = (Rails.env.development? && !context[:isApollo]) || Rails.env.test?
      context[:current_user] = user_for_graphiql if exception_condition

      raise GraphQL::ExecutionError, 'ログインが見当たりません。' unless context[:current_user]

      context[:current_user].present?
    end

    private

      def user_for_graphiql
        # graphiql内及びテスト環境のみで使用する仮のログインユーザー
        {
          id: 0,
          name: 'graphiql user',
          email: 'graphiql@exmaple.com'
        }
      end
  end
end
