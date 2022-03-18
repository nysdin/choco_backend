module Resolvers
  class LoginRequiredResolver < GraphQL::Schema::Resolver
    def authorized?(_args = '')
      UserServices::ConfirmAuthorizedUserService.new(context: context).execute
    end
  end
end
