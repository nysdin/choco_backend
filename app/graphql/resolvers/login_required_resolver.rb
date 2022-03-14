module Resolvers
  class LoginRequiredResolver < GraphQL::Schema::Resolver
    def authorized?(_args = '')
      Users::ConfirmAuthorizedUserService.new(context: context).execute
    end
  end
end
