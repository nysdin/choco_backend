module Resolvers
  class LoginRequiredResolver < GraphQL::Schema::Resolver
    def authorized?(_args = '')
      context[:current_user] = user_for_graphiql if Rails.env.development? && !context[:isApollo]

      raise GraphQL::ExecutionError, 'ログインが見当たりません。' unless context[:current_user]

      context[:current_user].present?
    end

    private

      def user_for_graphiql
        # graphiql内だけで使用する仮のログインユーザー
        {
          id: 0,
          name: 'graphiql user',
          email: 'graphiql@exmaple.com'
        }
      end
  end
end
