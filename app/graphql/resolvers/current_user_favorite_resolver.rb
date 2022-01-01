module Resolvers
  class CurrentUserFavoriteResolver < LoginRequiredResolver
    type Types::FavoriteType, null: true
    argument :merchandise_id, Integer, required: true

    def resolve(merchandise_id:)
      Favorite.find_by(
        merchandise_id: merchandise_id,
        user_id: context[:current_user][:id]
      )
      
    end
  end
end
