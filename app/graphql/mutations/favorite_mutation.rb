module Mutations
  class FavoriteMutation < BaseMutation
    field :favorite, Types::FavoriteType, null: true
    argument :merchandise_id, Integer, required: true
    argument :is_favorited, Boolean, required: true

    def resolve(merchandise_id:, is_favorited:)
      user_id = context[:current_user][:id]

      favorite = FavoriteServices::ChangeFavoriteService.new(
        user_id: user_id,
        merchandise_id: merchandise_id,
        is_favorited: is_favorited
      ).execute

      { favorite: favorite }
    end
  end
end
