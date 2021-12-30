module Resolvers
  class CurrentUserFavoriteResolver < LoginRequiredResolver
    type Types::FavoriteType, null: true
    argument :merchandise_id, Integer, required: true

    def resolve(merchandise_id:)
      favorite = Favorite.find_by(
        merchandise_id: merchandise_id,
        user_id: context[:current_user][:id]
      )

      puts 'ここにいいねはあるんか？！'
      pp favorite
    end
  end
end
