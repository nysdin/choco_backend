class AuthRepository
  def initialize(id_token:)
    @id_token = id_token
  end

  def verify_google_auth_token
    return if @id_token.blank?

    begin
      payload = Google::Auth::IDTokens.verify_oidc(
        @id_token,
        aud: ENV['GOOGLE_AUTH_CLIENT_ID']
      )
    rescue => e
      Rails.logger.debug { "エラーの内容: #{e}" }
      payload = ''
    end

    payload
  end
end
