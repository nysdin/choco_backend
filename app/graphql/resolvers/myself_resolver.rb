module Resolvers
  class MyselfResolver < LoginRequiredResolver
    type Types::UserType, null: false

    def resolve
      context[:current_user]
    end
  end
end