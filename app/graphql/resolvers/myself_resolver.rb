module Resolvers
  class MyselfResolver < LoginRequiredResolver
    type Types::UserType, null: true

    def resolve
      login_user_email = context[:current_user][:email]
      UserServices::PrepareLoginUserService.new(email: login_user_email).execute
    end
  end
end
