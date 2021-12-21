module Resolvers
  class MyselfResolver < LoginRequiredResolver
    type Types::UserType, null: true

    def resolve
      ## -> graphql-batchを使わない書き方
      # user = User.eager_load(:listed_merchandises).find(1)
      login_user_id = context[:current_user][:id]
      Loaders::RecordLoader.for(User).load(login_user_id)
    end
  end
end
