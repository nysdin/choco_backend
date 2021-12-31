module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

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
