class FavoriteRepository
  def add_favorite(user_id:, merchandise_id:)
    begin
      Rails.logger.info '--- 新規のいいねを作成 ---'
      favorite = Favorite.create!(
        merchandise_id: merchandise_id,
        user_id: user_id
      )
    rescue => e
      Rails.logger.debug { "error type: #{e.class}" }
      Rails.logger.debug { "created error content: #{e}" }
    end
  end

  def find_specific_favorite(user_id:, merchandise_id:)
    Favorite.find_by(
      merchandise_id: merchandise_id,
      user_id: user_id
    )
  end

  def remove_favorite(favorite:)
    begin
      Rails.logger.info '--- いいねの取り消しを実行 ---'
      favorite.destroy!
    rescue => e
      Rails.logger.debug { "error type: #{e.class}" }
      Rails.logger.debug { "created error content: #{e}" }
    end
  end
end
