module Mutations
  class FavoriteMutation < BaseMutation
    field :favorite, Types::FavoriteType, null: true
    argument :merchandise_id, Integer, required: true
    argument :is_favorited, Boolean, required: true

    def resolve(merchandise_id:, is_favorited:)
      user_id = context[:current_user][:id]
      favorite = Favorite.find_by(
        merchandise_id: merchandise_id,
        user_id: user_id
      )

      able_to_favorite_condition = is_favorited && !favorite # => いいねできるときの条件
      disable_to_favorite_condition = !is_favorited && favorite # => いいねの取り消しができるときの条件

      if able_to_favorite_condition
        begin
          puts '--- 新規のいいねを作成 ---'
          favorite = Favorite.create!(
            merchandise_id: merchandise_id,
            user_id: user_id,
          )
        rescue => e
          puts "error type: #{e.class}"
          puts "created error content: #{e}"
        end
      elsif disable_to_favorite_condition
        begin
          puts '--- いいねの取り消しを実行 ---'
          favorite.destroy!
        rescue => e
          puts "error type: #{e.class}"
          puts "created error content: #{e}"
        end
      else
        puts '-- 何も起きていない --'
        p "is favorite => #{is_favorited}"
        p "favorite record => #{favorite}"
      end
      # binding.pry

      puts '--- 最終的な結果 ---'
      pp favorite

      { favorite: favorite }
    end
  end
end
