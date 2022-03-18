class VerifyGoogleAuthTokenService
  def initialize(id_token = '')
    @id_token = id_token
  end

  def execute
    AuthRepository.new(id_token: @id_token).verify_google_auth_token
  end
end
