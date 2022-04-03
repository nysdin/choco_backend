module Resolvers
  class CurrentUserFavoriteResolver < LoginRequiredResolver
    type Types::FavoriteType, null: true
    argument :merchandise_id, Integer, required: true

    def resolve(merchandise_id:)
      FavoriteServices::FindSpecificFavoriteService.new(user_id: context[:current_user][:id], merchandise_id: merchandise_id).execute
    end
  end
end
